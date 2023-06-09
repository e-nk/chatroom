// import React from "react";
// import {BrowserRouter,Switch, Route } from "react-router-dom";
// import Home from "./components/Home";
// import Dashboard from "./components/Dashboard";



// function App() {
//   return (
//     <div className="App">
//       <BrowserRouter>
      
//       <Switch>
//         <Route exac path={"/"}><Home/></Route>
//         <Route exac path={"/dashboard"} ><Dashboard/></Route>
//       </Switch>
//       </BrowserRouter>

//     </div>
//   );
// }

// export default App;


import React, { Component } from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";
import axios from "axios";
import Home from "./components/Home";
import Dashboard from "./components/Dashboard";

class App extends Component {
constructor(props) {
super(props);
this.state = {
loggedInStatus: "NOT_LOGGED_IN",
user: {}
};
this.checkLoginStatus = this.checkLoginStatus.bind(this);
this.handleLogin = this.handleLogin.bind(this);
this.handleLogout = this.handleLogout.bind(this);
}

checkLoginStatus() {
axios
.get("http://localhost:3000/logged_in", { withCredentials: true })
.then(response => {
if (response.data.logged_in && this.state.loggedInStatus === "NOT_LOGGED_IN") {
this.setState({
loggedInStatus: "LOGGED_IN",
user: response.data.user
});
} else if (!response.data.logged_in && this.state.loggedInStatus === "LOGGED_IN") {
this.setState({
loggedInStatus: "NOT_LOGGED_IN",
user: {}
});
}
})
.catch(error => {
console.log("check login error", error);
});
}

componentDidMount() {
this.checkLoginStatus();
}

handleLogin(data) {
this.setState({
loggedInStatus: "LOGGED_IN",
user: data.user
});
}

handleLogout() {
this.setState({
loggedInStatus: "NOT_LOGGED_IN",
user: {}
});
}

render() {
return (
<div className="App">
<BrowserRouter>
<Switch>
<Route
exact
path={"/"}
render={props => (
<Home
{...props}
handleLogin={this.handleLogin}
handleLogout={this.handleLogout}
loggedInStatus={this.state.loggedInStatus}
/>
)}
/>
<Route
exact
path={"/dashboard"}
render={props => (
<Dashboard
{...props}
loggedInStatus={this.state.loggedInStatus}
/>
)}
/>
</Switch>
</BrowserRouter>
</div>
);
}
}

export default App;