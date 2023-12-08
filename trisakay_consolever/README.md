# TriSakay Console Version:

This Python script implements a console-based application for a transportation service called "TriSakay." The script leverages MySQL as the backend database to manage user data, bookings, and interactions between passengers and drivers. The key functionalities include user sign-up, login, booking a ride, and additional options such as updating user information, deleting users, and viewing bookings for drivers.

### Features:

- **User Management:**
  - Sign up as a driver or passenger.
  - Log in with existing credentials.

- **Booking System:**
  - Passengers can book rides with available drivers.
  - Drivers can view and accept pending bookings.

- **Additional Options:**
  - Update user information (user type, password).
  - Delete user accounts.
  - View bookings for drivers.

### Usage:

1. **Sign Up:**
    - Run the script and choose the "Sign Up" option.
    - Enter a unique username and password.
    - Select user type: Driver or Passenger.

2. **Log In:**
    - Log in with your username and password.
    - Access features based on your user type.

3. **Booking a Ride:**
    - Passengers can view available drivers and book rides.

4. **Additional Options:**
    - Update user information (user type, password).
    - Delete user accounts.
    - View bookings for drivers.

5. **Exit:**
    - Choose the "Exit" option to end the application.

### Requirements:

- ![Python](https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue)   
- ![MySql](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
- `mysql-connector` library run ![windowsterminal](https://img.shields.io/badge/windows%20terminal-4D4D4D?style=for-the-badge&logo=windows%20terminal&logoColor=white)   and install using `pip install mysql-connector-python`

### Setup:

1. Ensure you have Python and MySQL installed on your system.
2. Install the required library: `pip install mysql-connector-python`
3. Set up a MySQL database named `trikeSakay` with appropriate user credentials (refer to `DATABASE_CONFIG` in the script).

### IDE/Compiler:

We recommend using ![Pycharm](https://img.shields.io/badge/PyCharm-000000.svg?&style=for-the-badge&logo=PyCharm&logoColor=white) as the integrated development environment (IDE) for running and managing the TrikeSakay console application.

### Run:

1. Open CMD.
  
2. Use the cd command to navigate to the directory where your Python project is located.
   
`cd path\to\your\project`

3.Run your Python script using the python command followed by the script's name.

`python trisakayconsole.py`

### Contributing:

If you'd like to contribute to the TriSakay project, please follow these steps:

1. Fork the repository.
2. Create a new branch for your contributions.
3. Make your changes, ensuring adherence to coding standards and project guidelines.
4. Submit a pull request, providing a clear description of your changes.

We welcome and appreciate contributions from the community!


<div align="center">
  <img alt="MySql" src="https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white" width="120">
  <img alt="Pycharm" src="https://img.shields.io/badge/PyCharm-000000.svg?&style=for-the-badge&logo=PyCharm&logoColor=white" width="120">
</div>

<p align="center">
  <img src="https://user-images.githubusercontent.com/74038190/212257468-1e9a91f1-b626-4baa-b15d-5c385dfa7ed2.gif" alt="Center" width="100" height="100">
  <img src="https://user-images.githubusercontent.com/74038190/212257472-08e52665-c503-4bd9-aa20-f5a4dae769b5.gif" alt="Right-center" width="100" height="100"> 
</p>
