import React, { useState, useEffect } from "react";
import RatingStar from "./RatingStar";
import { Rating } from "@mui/material";
import { useParams } from "react-router-dom";

const RatingList = ({ ratings }) => {
  return (
    <div className="sm: flex sm: mt-3 sm: p-3 lg:flex lg:flex-col lg:w-1/2 lg:p-4 lg:overflow-y-auto lg:max-h-96">
      <h2 className="sm: text-lg lg:text-2xl lg:mb-4">Other Ratings</h2>
      {!ratings ? (
        <>No ratings for this product</>
      ) : (
        <>
          {ratings.map((review, index) => (
            <div key={index} className="mb-4">
              <div className="flex flex-row">
                <Rating
                  name="simple-controlled"
                  value={review.star_rating}
                  readOnly
                  precision={0.5}
                />
                {/* <p className="text-gray-700 text-sm ">{`${review.submitted_date}`}</p> */}
              </div>
              <p className="text-gray-700 text-lg font-semibold">{`${review.title}`}</p>
              <p className="text-gray-700 text-base">{`${review.product_review}`}</p>
              {""}
              <p className="text-gray-700 text-xs mt-1">
                By {`${review.customer_name}`}
              </p>
            </div>
          ))}
        </>
      )}
    </div>
  );
};

const ReviewForm = ({ onSubmit }) => {
  const [rating, setRating] = useState(0);
  const [isGuestMode, setGuestMode] = useState(false);
  const [comment, setReview] = useState("");
  const [title, setTitle] = useState("");
  const { prodId } = useParams();
  const custId = parseInt(sessionStorage.getItem("custId"));
  useEffect(() => {
    if (custId == "0" || custId == null) {
      setGuestMode(true);
    }
  });

  const handleSubmit = (e) => {
    e.preventDefault();
    onSubmit({ rating, prodId, custId, comment, title });
    // Clear the form fields after submission
    setRating(0);
    setReview("");
    setTitle("");
  };
  if (isGuestMode) {
    return <>Please Sign in to give review</>;
  }

  return (
    <div className="sm: p-3 lg:flex lg:flex-col lg:w-1/2 lg:p-4">
      <h2 className="sm: text-md sm: font-bold sm: mb-1 lg:text-xl lg:font-bold lg:mb-4">Enter a New Review</h2>
      <form onSubmit={handleSubmit}>
        <label className="block text-base mb-2">
          Rating:
          <Rating
            name="simple-controlled"
            value={rating}
            onChange={(event, newValue) => {
              setRating(newValue);
            }}
            precision={0.5}
          />
        </label>
        <label className="block text-base mb-2">
          Title:
          <input
            type="text"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            className="w-full p-2 border rounded"
            required
          />
        </label>
        <label className="block text-base mb-2">
          Write a Comment
          <textarea
            value={comment}
            onChange={(e) => setReview(e.target.value)}
            className="w-full p-2 border rounded"
            required
          />
        </label>

        <button
          type="submit"
          className="bg-primecolor font-content text-white text-base p-2  hover:opacity-80"
        >
          Submit
        </button>
      </form>
    </div>
  );
};

const RatingsAndForm = ({ ratingDetails }) => {
  const [reviews, setReviews] = useState([]);
  useEffect(() => {
    ratingDetails.map((product) => {
      const getRatingsFromServer = async () => {
        const ratingsFromServer = await fetchRatings(product.id);
        setReviews(ratingsFromServer);
      };
      getRatingsFromServer();
    });
  }, [reviews]);

  const fetchRatings = async (prodId) => {
    const res = await fetch(`http://localhost:4000/ratings/?prodId=${prodId}`);
    const data = await res.json();
    return data;
  };
  const handleReviewSubmit = async (newReview) => {
    console.log(newReview);
    const res = await fetch("http://localhost:4000/rateProduct", {
      method: "POST",
      headers: {
        "Content-type": "application/json",
      },
      body: JSON.stringify(newReview),
    });
    const review = await res.json();
    setReviews([...reviews, review]);
  };

  return (
    <div className="sm: flex sm: flex-col sm: border-2 sm: border-gray-700 sm: w-[200px] sm: -ml-8 sm: mt-2 lg:w-2/3 lg:ml-48 lg:flex lg:flex-row lg:justify-center lg:border-2 lg:border-gray-700">

      <RatingList ratings={reviews} />

      <ReviewForm onSubmit={handleReviewSubmit} />
    </div>
  );
};

export default RatingsAndForm;
