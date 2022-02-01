import React, { useEffect, useState, Fragment } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
// import 'bootstrap/dist/css/bootstrap.min.css';
import styled from "styled-components";

const Sort = () => {
	const [respo, setRespo] = useState([]);
	const [active, setActive] = useState("sort");
	const [stat, setStat] = useState(0);
	const [flag, setFlag] = useState(false);
	const [type, setType] = useState("");

	async function SortStudentsData(){
  	await axios.get(`/sort/${type}`)
      .then(resp => {
      	setRespo(resp.data.data)
      })
      .catch((error) => console.error(error));
	};
	console.log(respo);

	function getSortedData(){
		SortStudentsData();
		setFlag(true);
		setRespo([]);
	}
	
	const students = respo.map(item => {
		return (
			<Fragment>
				<div><span>Student Id : {item.id}</span>
					
						<li key={item.id}> Name : {item.attributes.name}</li>
						<li key={item.id}> Age : {item.attributes.age}</li>
						<li key={item.id}> Gender : {item.attributes.gender}</li>
					
					<br></br>
				</div>
			</Fragment>
			)
		}
	);

	return (
		<Fragment>
		<div>
	        <h1>Sorted students</h1>
			<span>Sort By :  
			    <select name='type' value={type} onChange={e=>{setType(e.target.value)}} required="required" >
			    	<option value="">Select</option>
				    <option value="id">Id</option>
				    <option value="name">Name</option>
				    <option value="age">Age</option>
				</select>
				<br></br>
				<Button variant="primary"  onClick={
				  	getSortedData
				  }>
				    Sort
				 </Button>
			</span>
	      {flag === true && 
	      
	          <div>
	          <br></br>
	          	{students}
	          </div>
	      }
	      </div>
    </Fragment>
	)
};

export default Sort;