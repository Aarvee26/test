import React, { useEffect, useState, Fragment } from "react";
import { Routes, Route } from "react-router-dom";
import Button from "react-bootstrap/Button";
// import 'bootstrap/dist/css/bootstrap.min.css';
import styled from "styled-components";
import Add from "./AddStudents";
import Show from "./ShowStudents";
import Update from "./UpdateStudents";
import Delete from "./DeleteStudents";
import Sort from './SortStudents';

const title = styled.div`
  text-align: center;
`;

const home = () => {
  const [active, setActive] = useState();

  return (
    <Fragment>
      <div>
        <h1>Students Module1</h1>
      </div>
      <nav>
        <br></br>
        <div>
          <Button type="submit" onClick={() => setActive("FirstCard")}>
            Show Student
          </Button>
        </div>
        <br></br>
        <div>
          <Button type="submit" onClick={() => setActive("SecondCard")}>
            Add Student
          </Button>
        </div>
        <br></br>
        <div>
          <Button type="submit" onClick={() => setActive("ThirdCard")}>
            Update Student
          </Button>
        </div>
        <br></br>
        <div>
          <Button type="submit" onClick={() => setActive("FourthCard")}>
            Remove Student
          </Button>
        </div>
        <br></br>
        <div>
          <Button type="submit" onClick={() => setActive("FifthCard")}>
            Sort Students
          </Button>
        </div>
      </nav>
      <div>
        {active === "FirstCard" && <Show />}
        {active === "SecondCard" && <Add />}
        {active === "ThirdCard" && <Update />}
        {active === "FourthCard" && <Delete />}
        {active === "FifthCard" && <Sort/>}
      </div>
    </Fragment>
  );
};

export default home;