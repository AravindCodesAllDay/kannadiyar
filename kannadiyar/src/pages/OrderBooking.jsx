import Footer from "../components/Footer";
import Myaddress from "../components/Myaddress";
import Topnavbar from "../components/Topnavbar";
import Topofferbar from "../components/Topofferbar";
import Offcanvas from "react-bootstrap/Offcanvas";
import Addressmodel from "../components/Addressmodel";
import Counter from "../components/Counter";
import { useState, useEffect } from "react";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { useNavigate } from "react-router-dom";

function OrderBooking() {

  const custId = sessionStorage.getItem('custId');
  const [isGuestMode,setIsGuestMode] = useState(false);
  const [cartItems, setCartItems] = useState([]);
  const [subTotal, setSubTotal] = useState();
  const [selectedAddressId, setSelectedAddressId] = useState(null);

  // Function to receive the selected address ID from MyAddress component
  const handleAddressSelect = (addressId) => {
    setSelectedAddressId(addressId);
  };
  const token = sessionStorage.getItem("token");

  const navigate = useNavigate();



  useEffect(() => {
    let totalMRP = 0;
    let cartLength = cartItems.length;
    cartItems.forEach((item) => {
      totalMRP += (parseFloat(item.mrp) * item.quantity); // Assuming 'mrp' is a string representing price
    });
    totalMRP = totalMRP.toFixed(2);
    setSubTotal(totalMRP);
    // sessionStorage.setItem('cartDetails', JSON.stringify({cartLength,totalMRP}));
  }, [cartItems]);

  useEffect(() => {
    const getCartItems = async () => {
      const cartItemsFromServer = await fetchCartItems();
      setCartItems(cartItemsFromServer);
    };
    getCartItems();
    // console.log(cartItems);
  }, []);

  const fetchCartItems = async () => {
    const res = await fetch(`http://localhost:4000/api/cart/${custId}`);
    const data = await res.json();
    return data;
  };

  const increaseQuantity = async (itemId) => {
    try {
      const updatedCart = cartItems.map((item) => {
        if (item.id === itemId) {
          const updatedItem = { ...item, quantity: item.quantity + 1 };
          // Update quantity in the database using a fetch/axios PUT request
          updateCartItemQuantity(updatedItem); // Implement this function to update quantity in the backend
          return updatedItem;
        }
        return item;
      });

      setCartItems(updatedCart);
    } catch (error) {
      console.error("Error increasing quantity:", error);
      // Handle error
    }
  };

  const decreaseQuantity = async (itemId) => {
    try {
      const updatedCart = cartItems.map((item) => {
        if (item.id === itemId && item.quantity > 1) {
          const updatedItem = { ...item, quantity: item.quantity - 1 };
          // Update quantity in the database using a fetch/axios PUT request
          updateCartItemQuantity(updatedItem); // Implement this function to update quantity in the backend
          return updatedItem;
        }
        return item;
      });

      setCartItems(updatedCart);
    } catch (error) {
      console.error("Error decreasing quantity:", error);
      // Handle error
    }
  };

  const updateCartItemQuantity = async (updatedItem) => {
    try {
      await fetch(`http://localhost:4000/updateQuantity/?prodId=${updatedItem.id}&custId=${custId}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ quantity: updatedItem.quantity }),
      });
    } catch (error) {
      console.error("Error updating quantity in the backend:", error);
      // Handle error
    }
  };

  const handleCheckout = async () => {
    // console.log(cartItems)
    if (!selectedAddressId) {
      // If no address is selected, prevent checkout and prompt the user to select an address
      toast.error('Please select address', {
        position: toast.POSITION.TOP_RIGHT
      })
      return;
    }
    if (cartItems.length === 0) {
      // If the cart is empty, alert the user
      toast.error('Your cart is empty', {
        position: toast.POSITION.TOP_RIGHT
      })
      return;
    }
    try {
      const response = await fetch("http://localhost:4000/create-checkout-session", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ items: cartItems,addressId: selectedAddressId }), // Send cartItems to backend
      });

      const data = await response.json();
      window.location.href = data.url;
      // Redirect to the checkout URL returned by the backend

    } catch (error) {
      console.error("Error during checkout:", error);
      // Handle error
    }
  };
  useEffect(()=> {
    if (custId === '0' || custId === null) {
      setIsGuestMode(true);
}
},[])

if (isGuestMode) {
  return (
    <>
    <Topofferbar />
    <Topnavbar />
    <p className="mt-11 ml-4 text-2xl font-content">You are in guest mode...!!</p>
    <Footer />
 </>
)
}

  return (
    <>
      <ToastContainer />
      <Topofferbar />
      <Topnavbar />

      <h2 className=" sm: mt-3 sm: font-content sm: ml-1 sm: font-semibold lg:mt-4 lg:ml-20 lg:text-xl lg:font-semibold">
        Choose Delivery Address
      </h2>
      <div className=" lg:flex lg:flex-row">
        <div className="lg:flex lg:flex-col">
          <div className="sm: ml-1 sm: mr-1 md:mr-3 lg:ml-20 lg:mt-5">
            <Myaddress onAddressSelect={handleAddressSelect} />
            <div className=" sm: mt-3 sm: ml-[120px] sm: w-2/3 lg:mt-5 lg:ml-80">
              {/* <Addressmodel /> */}
            </div>
          </div>
        </div>
        <div className="sm: flex sm: flex-col sm: ml-1 sm: mr-1 sm: mt-3 lg:flex lg:flex-col">
          <div className="lg:ml-14 border-1 p-4 rounded-md">
            <Offcanvas.Header closeButton>
              <Offcanvas.Title className="">Shopping Cart</Offcanvas.Title>
            </Offcanvas.Header>
            <Offcanvas.Body>
              {cartItems.map((item) => (
                <div className="lg:flex lg:flex-row lg:mt-5">
                  <img
                    className="lg:h-20 lg:w-20 lg:rounded-full lg:mt-2"
                    src={`http://localhost:4000/uploads/${item.image}`}
                    alt=""
                  />
                  <div className="lg:flex lg:flex-col lg:ml-4">
                    <h1 className="lg:text-xl">{item.product_name} </h1>
                    <h1 className="lg:text-lg">₹{item.mrp}</h1>
                    <Counter
                      increase={() => increaseQuantity(item.id)}
                      decrease={() => decreaseQuantity(item.id)}
                      quantity={item.quantity}
                    />
                  </div>
                  <h2 className="lg:text-lg lg:ml-20 lg:mt-5 lg:font-semibold">
                    ₹{item.mrp}
                  </h2>
                </div>
              ))}
              <div className="flex flex-row mt-7">
                <h2 className=" text-xl font-bold">Subtotal</h2>
                <h2 className="ml-6 text-xl font-semibold">₹{subTotal}</h2>
              </div>
              <div className="flex flex-col">
               
                <button onClick={handleCheckout} className="bg-primecolor hover:opacity-50 items-center text-orange-100 px-4 py-2 rounded mt-4 cursor-pointer">
                  Checkout
                </button>
              </div>
            </Offcanvas.Body>
          </div>
        </div>
      </div>
      <Footer />
    </>
  );
}

export default OrderBooking;
