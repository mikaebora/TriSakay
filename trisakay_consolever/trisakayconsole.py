import json
import os
import mysql.connector
from typing import Optional

DATABASE_CONFIG = {
    'host': '127.0.0.1',
    'database': 'trikeSakay',
    'user': 'root',
    'password': '1234',
}


def create_connection():
    try:
        connection = mysql.connector.connect(**DATABASE_CONFIG, autocommit=True)
        return connection
    except mysql.connector.Error as e:
        print(f"Error: {e}")
        return None


def execute_query(query, params=None) -> Optional[mysql.connector.cursor.MySQLCursor]:
    connection = create_connection()
    cursor = None
    result = None

    if connection:
        try:
            cursor = connection.cursor()
            cursor.execute(query, params)
            result = cursor.fetchall()
            connection.commit()
        except mysql.connector.Error as e:
            print(f"Error: {e}")
        finally:
            if cursor:
                cursor.close()
            connection.close()

    return cursor, result


def load_users():
    query = "SELECT * FROM users"
    cursor, result = execute_query(query)
    users = {}

    if cursor:
        for row in result:
            username = row[1]
            user_type = row[2]
            password = row[3]
            bookings_json = row[4]

            if bookings_json and bookings_json.strip():
                try:
                    bookings = json.loads(bookings_json)
                except json.decoder.JSONDecodeError:
                    print(f"Error decoding JSON for user {username}. JSON data: {bookings_json}")
                    bookings = []
            else:
                bookings = []

            users[username] = {
                'type': user_type,
                'password': password,
                'bookings': bookings
            }

        cursor.close()

    return users


def save_users(users):
    query = "INSERT INTO users (username, user_type, password, bookings) VALUES (%s, %s, %s, %s) ON DUPLICATE KEY UPDATE user_type = VALUES(user_type), password = VALUES(password), bookings = VALUES(bookings)"
    connection = create_connection()

    if connection:
        try:
            cursor = connection.cursor()
            for username, user_info in users.items():
                params = (username, user_info['type'], user_info['password'], json.dumps(user_info['bookings']))
                cursor.execute(query, params)
            connection.commit()
        except mysql.connector.Error as e:
            print(f"Error: {e}")
        finally:
            connection.close()


def delete_user(username):
    query = "DELETE FROM users WHERE username = %s"
    execute_query(query, (username,))

    # Check if the user was deleted successfully
    users = load_users()
    if username not in users:
        print(f"User {username} has been successfully deleted!")
    else:
        print(f"Failed to delete user {username}.")

    input("Press any key to continue...")


def update_user(username, user_info):
    query = "UPDATE users SET user_type = %s, password = %s, bookings = %s WHERE username = %s"
    params = (user_info['type'], user_info['password'], json.dumps(user_info['bookings']), username)
    execute_query(query, params)

    # Assuming the execution was successful, update the local users dictionary
    users = load_users()
    if username in users:
        users[username]['type'] = user_info['type']
        users[username]['password'] = user_info['password']
        users[username]['bookings'] = user_info['bookings']
        save_users(users)
    else:
        print(f"User {username} not found in the local data. Local data not updated.")


def signup_user():
    os.system('cls' if os.name == 'nt' else 'clear')
    print("""
    ███████╗ ██╗  ██████╗  ███╗   ██╗ ██╗   ██╗ ██████╗ 
    ██╔════╝ ██║ ██╔════╝  ████╗  ██║ ██║   ██║ ██╔══██╗
    ███████╗ ██║ ██║  ███╗ ██╔██╗ ██║ ██║   ██║ ██████╔╝
    ╚════██║ ██║ ██║   ██║ ██║╚██╗██║ ██║   ██║ ██╔═══╝ 
    ███████║ ██║ ╚██████╔╝ ██║ ╚████║ ╚██████╔╝ ██║     
    ╚══════╝ ╚═╝  ╚═════╝  ╚═╝  ╚═══╝  ╚═════╝  ╚═╝                                              
    """)
    username = input("Enter your username: ")
    password = input("Enter your password: ")

    print("\nSelect user type: ")
    print("\n[1] Driver")
    print("[2] Passenger")
    user_type_choice = input("\nEnter your choice [1-2]: ")

    if user_type_choice == '1':
        user_type = 'driver'
    elif user_type_choice == '2':
        user_type = 'passenger'
    else:
        print("Invalid choice. Defaulting to passenger.")
        user_type = 'passenger'

    users = load_users()

    if username in users:
        print("\nUsername already exists. Choose another username.")
        input("\nPress any key to continue...")
    else:
        users[username] = {'type': user_type, 'password': password, 'bookings': []}
        save_users(users)
        print(f"\n{user_type.capitalize()} account created successfully!")
        input("\nPress any key to continue...")


def login():
    os.system('cls' if os.name == 'nt' else 'clear')
    print("""
    ██╗       ██████╗   ██████╗  ██╗ ███╗   ██╗
    ██║      ██╔═══██╗ ██╔════╝  ██║ ████╗  ██║
    ██║      ██║   ██║ ██║  ███╗ ██║ ██╔██╗ ██║
    ██║      ██║   ██║ ██║   ██║ ██║ ██║╚██╗██║
    ███████╗ ╚██████╔╝ ╚██████╔╝ ██║ ██║ ╚████║
    ╚══════╝  ╚═════╝   ╚═════╝  ╚═╝ ╚═╝  ╚═══╝
    """)

    username = input("Enter your username: ")
    password = input("Enter your password: ")

    users = load_users()

    if username in users and users[username]['password'] == password:
        if users[username]['type'] == 'driver':
            driver_menu(username)
        elif users[username]['type'] == 'passenger':
            passenger_menu(username)
    else:
        print("\nInvalid username or password. Please try again.")

    input("\nPress any key to continue...")


def passenger_menu(username):
    while True:
        os.system('cls' if os.name == 'nt' else 'clear')
        print(f"Welcome, {username} (Passenger)!\n")
        print("[1] Book a ride")
        print("[2] Additional Options")
        print("[3] Exit")

        choice = input("\nEnter your choice [1-3]: ")

        if choice == '1':
            book_ride(username)
        elif choice == '2':
            additional_options_menu(username)
        elif choice == '3':
            break
        else:
            print("Invalid choice. Please enter 1, 2, or 3.")
            input("Press any key to continue...")


def driver_menu(username):
    while True:
        os.system('cls' if os.name == 'nt' else 'clear')
        print(f"Welcome, {username} (Driver)!\n")
        print("[1] View bookings")
        print("[2] Accept booking")
        print("[3] Additional Options")
        print("[4] Exit")

        choice = input("\nEnter your choice [1-4]: ")

        if choice == '1':
            view_bookings(username)
        elif choice == '2':
            accept_booking(username)
        elif choice == '3':
            additional_options_menu(username)
        elif choice == '4':
            break
        else:
            print("Invalid choice. Please enter 1, 2, 3, or 4.")
            input("Press any key to continue...")


def additional_options_menu(username):
    os.system('cls' if os.name == 'nt' else 'clear')
    print(f"Additional Options Menu for {username}!\n")
    print("[1] Delete User")
    print("[2] Update User Information")
    print("[3] Back to Main Menu")

    choice = input("\nEnter your choice [1-3]: ")

    if choice == '1':
        delete_user(username)
    elif choice == '2':
        update_user_menu(username)
    elif choice == '3':
        return
    else:
        print("Invalid choice. Please enter 1, 2, or 3.")
        input("Press any key to continue...")


def update_user_menu(username):
    os.system('cls' if os.name == 'nt' else 'clear')
    print(f"Update User Information for {username}!\n")
    print("[1] Update User Type")
    print("[2] Update Password")
    print("[3] Back to Options Menu")

    choice = input("\nEnter your choice [1-3]: ")

    if choice == '1':
        update_user_type(username)
    elif choice == '2':
        update_password(username)
    elif choice == '3':
        return
    else:
        print("Invalid choice. Please enter 1, 2, or 3.")
        input("Press any key to continue...")


def update_user_type(username):
    new_user_type = input("\nEnter the new user type (driver/passenger): ")
    users = load_users()

    if username in users:
        users[username]['type'] = new_user_type
        save_users(users)
        print(f"User type updated successfully to {new_user_type}!")
    else:
        print(f"User {username} not found in the local data. User type not updated.")

    input("Press any key to continue...")


def update_password(username):
    new_password = input("\nEnter the new password: ")
    users = load_users()

    if username in users:
        users[username]['password'] = new_password
        save_users(users)
        print("Password updated successfully!")
    else:
        print(f"User {username} not found in the local data. Password not updated.")

    input("Press any key to continue...")


def view_bookings(driver_username):
    users = load_users()
    driver_info = users[driver_username]

    if driver_info['bookings']:
        print("\nYour Bookings:")
        for booking in driver_info['bookings']:
            print(f"Passenger: {booking['passenger']}")
        input("\nPress any key to continue...")
    else:
        print("\nNo bookings available.")
        input("Press any key to continue...")


def book_ride(passenger_username):
    users = load_users()

    print("\nAvailable Drivers:")
    for username, user_info in users.items():
        if user_info['type'] == 'driver':
            print(username)

    driver_username = input("\nEnter the username of the driver you want to book: ")

    if driver_username in users and users[driver_username]['type'] == 'driver':

        booking = {'passenger': passenger_username, 'driver': driver_username}
        users[driver_username]['bookings'].append(booking)
        save_users(users)
        print("\nBooking successful!")
    else:
        print("Invalid driver username. Please try again.")

    input("Press any key to continue...")


def accept_booking(driver_username):
    users = load_users()
    driver_info = users[driver_username]

    if driver_info['bookings']:
        print("\nPending Bookings:")
        for i, booking in enumerate(driver_info['bookings']):
            print(f"{i + 1}. Passenger: {booking['passenger']}")

        choice = input("\nEnter the number of the booking you want to accept (0 to cancel): ")

        if choice.isdigit() and 0 <= int(choice) <= len(driver_info['bookings']):
            if int(choice) == 0:
                return
            else:
                accepted_booking = driver_info['bookings'].pop(int(choice) - 1)
                print(f"\nYou have accepted the booking from {accepted_booking['passenger']}.")
                input("Press any key to continue...")
        else:
            print("Invalid choice. Please enter a valid number.")
            input("Press any key to continue...")
    else:
        print("\nNo pending bookings.")
        input("Press any key to continue...")


def main():
    while True:
        os.system('cls' if os.name == 'nt' else 'clear')
        print("""
    ████████╗ ██████╗  ██╗ ███████╗  █████╗  ██╗  ██╗  █████╗  ██╗   ██╗
    ╚══██╔══╝ ██╔══██╗ ██║ ██╔════╝ ██╔══██╗ ██║ ██╔╝ ██╔══██╗ ╚██╗ ██╔╝
       ██║    ██████╔╝ ██║ ███████╗ ███████║ █████╔╝  ███████║  ╚████╔╝ 
       ██║    ██╔══██╗ ██║ ╚════██║ ██╔══██║ ██╔═██╗  ██╔══██║   ╚██╔╝  
       ██║    ██║  ██║ ██║ ███████║ ██║  ██║ ██║  ██╗ ██║  ██║    ██║   
       ╚═╝    ╚═╝  ╚═╝ ╚═╝ ╚══════╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝    ╚═╝   
   """)

        print("[1] Sign Up")
        print("[2] Log In")
        print("[3] Exit")

        choice = input("\nEnter your choice [1-3]: ")

        if choice == '1':
            signup_user()
        elif choice == '2':
            login()
        elif choice == '3':
            print("Goodbye!")
            break
        else:
            print("Invalid choice. Please enter 1, 2, or 3.")
            input("Press any key to continue...")


if __name__ == "__main__":
    main()
