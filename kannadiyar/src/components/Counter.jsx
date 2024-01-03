import {useState} from "react";

const Counter = ({ increase, decrease, quantity }) => {
  return (
    <div className="counter">
      <button onClick={decrease} className="counter-btn btn text-3xl ">
        -
      </button>
      &nbsp;
      <span className="counter-value">{quantity}</span>
      &nbsp;
      <button onClick={increase} className="counter-btn btn text-3xl">
        +
      </button>
    </div>
  );
};
export default Counter;