import React, { useState } from 'react';

function RegistrationForm() {

  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
 
  const [error, setError] = useState(null);

  const handleFormSubmit = async (event) => {
    event.preventDefault();

    const userData = {
      user: {
        email: email,
        password: password
        
      },
    };

    try {
      const response = await fetch('http://localhost:3000/sessions', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(userData),
      },{withCredentials: true}
      );

      if (!response.ok) {
        throw new Error(response.statusText);
      }

      // Registration successful, redirect to login page
     // window.location.href = '/login';
    } catch (error) {
      setError('Failed to register user');
    }
  };

  return (
    <div>
      <h1>Registration Form</h1>
      <form onSubmit={handleFormSubmit}>
        {error && <div>{error}</div>}
        <br />
        <label>
          Email:
          <input
            type="email"
            value={email}
            onChange={(event) => setEmail(event.target.value)}
          />
        </label>
        <br />
        <label>
          Password:
          <input
            type="password"
            value={password}
            onChange={(event) => setPassword(event.target.value)}
          />
        </label>
        <br />
        <button type="submit">Login</button>
      </form>
    </div>
  );
}

export default RegistrationForm;
