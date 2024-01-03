import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import CategoryButton from "./CategoryButton";
import logo from "../assets/logo.png";
import Form from "react-bootstrap/Form";
import { useNavigate } from "react-router-dom";
import WishlistOffCanvas from "./WishlistOffCanvas";

export default function Topnavbar() {
  const [searchInput, setSearchInput] = useState("");
  const [showLogin, setShowLogin] = useState(false);

  const handleSubmission = async () => {
    const getProduct = await fetch(
      `http://localhost:4000/search/${searchInput}`
    );
    const data = await getProduct.json();
    sessionStorage.setItem("result", JSON.stringify(data));
    window.location.href = "/result";
  };

  const navigate = useNavigate();
  const custId = sessionStorage.getItem("custId");
  useEffect(() => {
    if (custId == "0" || custId == null) {
      setShowLogin(true);
    }
  });

  function clicked(path) {
    navigate(path);
  }
  const { pathname } = useLocation();
  const [isMenuOpen, setMenuOpen] = useState(false);

  const toggleMenu = () => {
    setMenuOpen(!isMenuOpen);
  };

  const menuLinks = [
    { to: "/", text: "Home" },
    { to: "/Products", text: "Products" },
    { to: "/About", text: "About Us" },
    { to: "/Contact", text: "Contact" },
    { to: "/Reviews", text: "Reviews" },
  ];

  return (
    <nav className=" border-b-2 border-primecolor">
      <div className="flex flex-row mt-3">
        {/* logo */}
        <img
          src={logo}
          alt="kannadiyar-logo"
          className="lg:ml-72 ml-2 mr-1 lg:mr-28 w-28 h-16"
        />
        {/* place holder starts */}
        <Form className="flex flex-row h-11 ml-2 w-72 lg:w-80 ">
          <Form.Control
            type="search"
            placeholder="Search for Products"
            value={searchInput}
            onChange={(e) => setSearchInput(e.target.value)}
            className="me-2 font-content"
            aria-label="Search"
          />
          <div className="border p-2  rounded-lg bg-orange-100 hover:bg-primecolor text-primecolor hover:text-orange-100 lg:text-2xl">
            <ion-icon
              name="search-outline"
              onClick={handleSubmission}
            ></ion-icon>
          </div>
        </Form>
        {/* place holder ends */}
        {showLogin && (
          <div className="flex flex-col ml-1 lg:ml-28">
            <button
              className="text-sm lg:text-lg bg-orange-100 text-primecolor hover:bg-primecolor font-content lg:font-semibold px-4 py-2 rounded-lg ml-4 mt-1 hover:text-orange-100 cursor-pointer"
              onClick={() => clicked("/")}
            >
              Login
            </button>
          </div>
        )}
        <div className="border p-2 ml-28 mr-4 rounded-full w-10 h-11 text-2xl cursor-pointer text-primecolor bg-orange-100 hover:text-orange-100 hover:bg-primecolor lg:block hidden">
          <ion-icon
            onClick={() => clicked("/MyAccount")}
            name="person-outline"
          ></ion-icon>
        </div>
        <div className="border p-2 ml-2 mr-4 rounded-full w-10 h-11 text-2xl cursor-pointer text-primecolor bg-orange-100 hover:text-orange-100 hover:bg-primecolor lg:block hidden">
          <ion-icon
            onClick={() => clicked("/Wishlist")}
            name="heart-outline"
          ></ion-icon>
        </div>
        <div className="flex">
          <div className="hidden lg:block p-2">
            {" "}
            <WishlistOffCanvas />{" "}
          </div>
        </div>
      </div>
      <div className="lg:container lg:mx-auto lg:flex lg:justify-between lg:items-center">
        <div className="flex items-center">
          <div>
            <CategoryButton />
            
          </div>
          <button
            onClick={toggleMenu}
            className="text-primecolor focus:outline-none text-2xl lg:hidden ml-4"
          >
            ☰
          </button>
        </div>
        <div
          className={`lg:flex  lg:items-center lg:w-auto ${
            isMenuOpen ? "block" : "hidden"
          }`}
        >
          <div className="hidden lg:block mr-44 ">
          <ul className="lg:flex lg:space-x-24 text-lg  space-y-0 font-content ">
            
            {menuLinks.map((link, index) => (
              <li key={index}>
                <a
                  href={link.to}
                  className={`text-primecolor ${
                    pathname === link.to ? "font-bold" : ""
                  }`}
                >
                  {link.text}
                </a>
              </li>
            ))}
          
            <li className="lg:space-y-0 space-y-4 lg:hidden">
              <div className=" text-primecolor  cursor-pointer lg:hidden">
                <h1 onClick={() => clicked("/MyAccount")}>My Account</h1>
              </div>
              <div className="text-primecolor cursor-pointer lg:hidden">
                <h1 onClick={() => clicked("/Wishlist")}>Wishlist</h1>
              </div>
              <div className="text-primecolor cursor-pointer lg:hidden">
                <h1 onClick={() => navigate("/booking")}>Cart</h1>
              </div>
            </li>
            
          </ul>
          </div>
          <ul className="lg:flex lg:space-x-4 space-y-4 lg:space-y-0 ml-28 font-content ">
            <div className="lg:hidden ">
            {menuLinks.map((link, index) => (
              <li key={index}>
                <a
                  href={link.to}
                  className={`text-primecolor ${
                    pathname === link.to ? "font-bold" : ""
                  }`}
                >
                  {link.text}
                </a>
              </li>
            ))}

            <li className="lg:space-y-0 space-y-4 ">
              <div className=" text-primecolor  cursor-pointer lg:hidden">
                <h1 onClick={() => clicked("/MyAccount")}>My Account</h1>
              </div>
              <div className="text-primecolor cursor-pointer lg:hidden">
                <h1 onClick={() => clicked("/Wishlist")}>Wishlist</h1>
              </div>
              <div className="text-primecolor cursor-pointer lg:hidden">
                <h1 onClick={() => navigate("/booking")}>Cart</h1>
              </div>
            </li>
            </div>
          </ul>
        </div>
      </div>
    </nav>
  );
}
