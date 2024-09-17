employees = {}

def add_employee():
    emp_id = input("Enter Employee ID: ")
    name = input("Enter Employee Name: ")
    name=name.capitalize()
    salary = input("Enter Employee Salary: ")
    department = input("Enter Employee Department: ")
    employees[emp_id] = {"name": name, "salary": salary, "department": department}
    print(f"Employee {name} added.\n")

def search_employee():
    name = input("Enter Employee Name to Search: ")
    name=name.capitalize()
    found = False
    for emp_id, details, in employees.items():
        if details["name"].capitalize() == name.capitalize():
            print(f"ID: {emp_id}, Name: {details['name']}, Salary: {details['salary']}, Department: {details['department']}")
            found = True
    if not found:
        print("Employee not found")

def delete_employee():
    emp_id = input("Enter Employee ID to Delete: ")
    if emp_id in employees:
        del employees[emp_id]
        print(f"Employee with ID {emp_id} deleted")
    else:
        print("Employee not found.\n")

def show_all_employees():
    if employees:
        for emp_id, details in employees.items():
            print(f"ID: {emp_id}, Name: {details['name']}, Salary: {details['salary']}, Department: {details['department']}")
        print("")
    else:
        print("No employees to show.")

while True:
    print("1. Add Employee")
    print("2. Search Employee by Name")
    print("3. Delete Employee")
    print("4. Show All Employees")
    print("5. Quit")
    choice = input("Enter your choice: ")
    
    if choice == '1':
        add_employee()
    elif choice == '2':
        search_employee()
    elif choice == '3':
        delete_employee()
    elif choice == '4':
        show_all_employees()
    elif choice == '5':
        break
    else:
        print("Invalid choice. Please try again")
