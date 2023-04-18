import React from "react";
import {BrowserRouter,Switch, Route } from "react-router-dom";
import Home from "./components/Home";
import Dashboard from "./components/Dashboard";



function App() {
  return (
    <div className="App">
      <BrowserRouter>
      
      <Switch>
        <Route exac path={"/"}><Home/></Route>
        <Route exac path={"/dashboard"} ><Dashboard/></Route>
      </Switch>
      </BrowserRouter>

    </div>
  );
}

export default App;




//   return (
//     <div>
//       {isLoggedOut ? <NavbarFront /> : <Navbar />}

//       <Switch>
//         <Route exact path="/products">
//           <Products />
//         </Route>
//         <Route path="/new-arrivals">
//           <NewArrivals />
//         </Route>
//         <Route path="/cart">
//           <Cart />
//         </Route>
//         <Route path="/wishlist">
//           <Wishlist />
//         </Route>
//         <Route path="/product/:productId">
//           <ProductDetail />
//         </Route>
//         <Route path="/logout">
//           <Logout onLogout={handleLogout} />
//         </Route>
//         <Route path="/home">
//           <Home/>
//         </Route>
//         <Route path="/about">
//           <About/>
//         </Route>
//         <Route path="/login">
//           <Login/>
//         </Route>
//         <Route path="/reset-pass">
//           <ForgotPassword/>
//         </Route>
//         <Route path="/orders">
//           <Orders/>
//         </Route>
//         <Route path="/signup">
//           <Signup/>
//         </Route>
//         <Route path="/forgot-password">
//           <ForgotPassword/>
//         </Route>

//       </Switch>

//       <Footer />
//     </div>
//   );
// }


// export default App;
