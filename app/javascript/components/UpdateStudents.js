import React, { useEffect, useState, Fragment } from 'react'
import axios from "axios";
import {Button, Form} from "react-bootstrap";
// import 'bootstrap/dist/css/bootstrap.min.css';
import styled from "styled-components";

const Update =()=>{

	const [respo, setRespo] = useState([]);
	const [stat, setStat] = useState(0);
	const [name, setName] = useState("");
	const [age, setAge] = useState("");
	const [gender, setGender] = useState("");
	const [id, setId] = useState(0);
	const [flag, setFlag] = useState(false);

	function ShowStudentsData(){
	useEffect( async () => {
  	await axios.get(`/students_details/`)

      .then(resp => {
      	setRespo(resp.data.data)
      })
      .catch((error) => console.error(error));
 	},[stat]);
	};

	async function updateStudentsData(){
	  	await axios.put(`/students_details/${id}`, {name: name, age: age, gender:gender})
	      .then(resp => {
	      	setRespo(resp.data.data)
	      })
	      .catch((error) => console.error(error));
	      alert('Student updated successfully');
	      setName("");
	      setAge("");
	      setGender('');
	};
	console.log(respo);

	ShowStudentsData();

	const studentsData = respo.map(items => {
		return (
			<div>
			<Form>
				<span>Student Id : {items.id}</span>
				  <Form.Group className="new-student-name" controlId="formName">
				    <Form.Label>Name : </Form.Label>
				    <Form.Control value = {items.attributes.name} type="text" placeholder="Enter Name" onChange={e => setName(e.target.value)} required />
				  </Form.Group>

				  <Form.Group className="new-student-age" controlId="formAge">
				    <Form.Label>Age : </Form.Label>
				    <Form.Control value = {items.attributes.age} type="number" placeholder="Enter Age" onChange={e => setAge(e.target.value)} required />
				  </Form.Group>

				<span>Gender :  
				    <select name='gender' value={items.attributes.gender} onChange={e=>setGender(e.target.value)} required >
				    	<option value="">Select</option>
					    <option value="Male">Male</option>
					    <option value="Female">Female</option>
  					</select>
  				</span>
				  <br></br>
				  </Form>
				  <br></br>
				 </div>
			)
	});

	return (
		<Fragment>
			<div><h1>Add students</h1></div>
			<br></br>
			<div>
				{studentsData}
				  <br></br>
				  <br></br>
				  <Button variant="primary"  onClick={
				  	updateStudentsData
				  }>
				    Update
				  </Button>
			</div>
		</Fragment>
		)
};

export default Update;