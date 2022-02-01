import React, { useEffect, useState, Fragment } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
// import 'bootstrap/dist/css/bootstrap.min.css';
import styled from "styled-components";

const Show = () => {
const [respo, setRespo] = useState([]);
const [active, setActive] = useState("unsort");
const [stat, setStat] = useState(0);

function ShowStudentsData(){
	useEffect( async () => {
  	await axios.get(`/students_details/`)

      .then(resp => {
      	setRespo(resp.data.data)
      })
      .catch((error) => console.error(error));
 	},[stat]);
};

console.log(respo);

	ShowStudentsData();
  
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
        <h1>Show students</h1>
          <div>
          	{students}
          </div>
      </div>
    </Fragment>
  );
};

export default Show;