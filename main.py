import mysql.connector

# Connect to the database
db_connection = mysql.connector.connect(
    host="ANCDESK",
    user="root@localhost ",
    password="15042002",
    database="TANMAY"
)

# Function to create a new patient
def create_patient(cursor):
    first_name = input("Enter patient's first name: ")
    last_name = input("Enter patient's last name: ")
    gender = input("Enter patient's gender (Male/Female/Other): ")
    dob = input("Enter patient's date of birth (YYYY-MM-DD): ")
    address = input("Enter patient's address: ")
    city = input("Enter patient's city: ")
    state = input("Enter patient's state: ")
    zipcode = input("Enter patient's zip code: ")
    email = input("Enter patient's email: ")
    phone_number = input("Enter patient's phone number: ")
    emergency_contact_name = input("Enter emergency contact's name: ")
    emergency_contact_number = input("Enter emergency contact's number: ")

    # Insert into database
    query = "INSERT INTO Patients (FirstName, LastName, Gender, DateOfBirth, Address, City, State, ZipCode, Email, PhoneNumber, EmergencyContactName, EmergencyContactNumber) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    values = (first_name, last_name, gender, dob, address, city, state, zipcode, email, phone_number, emergency_contact_name, emergency_contact_number)
    cursor.execute(query, values)
    db_connection.commit()
    print("Patient added successfully!")

# Function to display all patients
def display_patients(cursor):
    query = "SELECT * FROM Patients"
    cursor.execute(query)
    patients = cursor.fetchall()

    if not patients:
        print("No patients found.")
    else:
        print("List of patients:")
        for patient in patients:
            print(patient)

# Main function
def main():
    while True:
        print("\nHospital Management System Menu:")
        print("1. Add New Patient")
        print("2. Display Patients")
        print("3. Exit")

        choice = input("Enter your choice: ")

        if choice == "1":
            create_patient(db_connection.cursor())
        elif choice == "2":
            display_patients(db_connection.cursor())
        elif choice == "3":
            print("Exiting...")
            break
        else:
            print("Invalid choice. Please enter a valid option.")

if __name__ == "__main__":
    main()

# Close the database connection
db_connection.close()
