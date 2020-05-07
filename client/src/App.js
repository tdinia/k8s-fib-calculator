import React, { Component } from "react";
import "./App.css";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import { FibView } from "./FibView";
import Fib from "./Fib";

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <header className="App-header">
            <Link to="/">Home</Link>
            <Link to="/fibview">Fib View</Link>
          </header>
          <div>
            <Route exact path="/" component={Fib} />
            <Route path="/fibview" component={FibView} />
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
