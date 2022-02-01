import React, { useEffect, useState, Fragment } from 'react'
import axios from "axios";
import {Button, Form} from "react-bootstrap";
// import 'bootstrap/dist/css/bootstrap.min.css';
import styled from "styled-components";

const Add=()=>{

	const [respo, setRespo] = useState([]);
	const [stat, setStat] = useState(0);
	const [name, setName] = useState("");
	const [age, setAge] = useState("");
	const [gender, setGender] = useState("");
	const [flag, setFlag] = useState(false);

	async function addStudentsData(){
	  	await axios.post(`/students_details`, {name: name, age: age, gender:gender})
	      .then(resp => {
	      	setRespo(resp.data.data)
	      })
	      .catch((error) => console.error(error));
	      alert('Student inserted successfully');
	      setName("");
	      setAge("");
	      setGender('');
	};
	console.log(respo);

	return (
		<Fragment>
			<div><h1>Add students</h1></div>
			<br></br>
			<div>
				<Form>
				  <Form.Group className="new-student-name" controlId="formName">
				    <Form.Label>Name : </Form.Label>
				    <Form.Control value = {name} type="text" placeholder="Enter Name" onChange={e => setName(e.target.value)} required="required" />
				  </Form.Group>

				  <Form.Group className="new-student-age" controlId="formAge">
				    <Form.Label>Age : </Form.Label>
				    <Form.Control value = {age} type="number" placeholder="Enter Age" onChange={e => setAge(e.target.value)} required ="required"/>
				  </Form.Group>

				<span>Gender :  
				    <select name='gender' value={gender} onChange={e=>setGender(e.target.value)} required="required" >
				    	<option value="">Select</option>
					    <option value="Male">Male</option>
					    <option value="Female">Female</option>
  					</select>
  				</span>
				  <br></br>
				  <br></br>
				  <br></br>
				  <Button variant="primary"  onClick={
				  	addStudentsData
				  }>
				    Submit
				  </Button>
				</Form>
			</div>
		</Fragment>
		)
};

export default Add;