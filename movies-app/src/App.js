import React, { useState, useEffect } from "react";
import "./App.css";
import Movies from "./Movies";
import Search from "./Search";

import Header from "./Header";

const MOVIE_API_URL = "https://www.omdbapi.com/?s=man&apikey=4a3b711b";

function App() {
  const [loading, setLoading] = useState(true);
  const [movies, setMovies] = useState([]);
  const [errorMsg, setErrorMsg] = useState(null);

  useEffect(() => {
    fetch(MOVIE_API_URL)
      .then((response) => response.json())
      .then((jsonResponse) => {
        setMovies(jsonResponse.Search);
        setLoading(false);
      });
  }, []);

  const search = (searchValue) => {
    setLoading(true);
    setErrorMsg(null);

    fetch(`https://www.omdbapi.com/?s=${searchValue}&apikey=4a3b711b`)
      .then((response) => response.json())
      .then((jsonResponse) => {
        if (jsonResponse.Response === "True") {
          console.log("working")
         setMovies(jsonResponse.Search);
          setLoading(false);
        } else {
          console.log("not working")
          setErrorMsg(jsonResponse.Error);
          setLoading(false);
        }
      });
  };

  return (
    <div className="App">
      <Header text="Harsh Pictures" />
      <Search search={search} />
      <p className="App-intro">Sharing a few of our favourite movies</p>
      <div className="movies">
        {loading && !errorMsg ? (
          <span>loading...</span>
        ) : errorMsg ? (
          <div className="errorMessage">{errorMsg}</div>
        ) : (
          movies.map((movie, index) => (
            <Movies key={`${index}-${movie.Title}`} movie={movie} />
            
          ))
          
        )}
      </div>
    </div>
  );
}

export default App;
