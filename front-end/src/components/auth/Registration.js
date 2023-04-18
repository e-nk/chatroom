import React, { useState } from 'react';

function RegistrationForm() {
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [passwordConfirmation, setPasswordConfirmation] = useState('');
  const [error, setError] = useState(null);

  const handleFormSubmit = async (event) => {
    event.preventDefault();

    const userData = {
      user: {
        username: username,
        email: email,
        password: password,
        password_confirmation: passwordConfirmation,
      },
    };

    try {
      const response = await fetch('http://localhost:3000/registrations', {
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
      window.location.href = '/login';
    } catch (error) {
      setError('Failed to register user');
    }
  };

  return (
    <div>
      <h1>Registration Form</h1>
      <form onSubmit={handleFormSubmit}>
        {error && <div>{error}</div>}
        <label>
          Username:
          <input
            type="text"
            value={username}
            onChange={(event) => setUsername(event.target.value)}
          />
        </label>
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
        <label>
          Confirm Password:
          <input
            type="password"
            value={passwordConfirmation}
            onChange={(event) => setPasswordConfirmation(event.target.value)}
          />
        </label>
        <br />
        <button type="submit">Register</button>
      </form>
    </div>
  );
}

export default RegistrationForm;
