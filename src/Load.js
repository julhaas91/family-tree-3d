import React, { useEffect } from "react";

const Load = ({ loadFamily }) => {
  // Load the family tree automatically when component mounts
  useEffect(() => {
    loadFamily();
  }, []);

  // Return an empty div - the family tree will be rendered by the loadFamily function
  return <div id='load'></div>;
}

export default Load;