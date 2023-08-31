import React, { useState } from "react";
const Search = (props) => {
  const [searchValue, setSearchValue] = useState("");

  const handleSearchInputChanges = (e)=>{
    setSearchValue(e.target.value);
  }

  const resetInputField = ()=>{
    setSearchValue("")
  }

  const callSearchFunction = (e) =>{
    e.preventDefault();
    props.search(searchValue);
    resetInputField();
  }
  return(
    <form className='search'>
        <input type="text" value = {searchValue} onChange = {handleSearchInputChanges}/>
        <input onClick = {callSearchFunction} type = "submit" value="SEARCH"/>
    </form>
  );
};
export default Search;
