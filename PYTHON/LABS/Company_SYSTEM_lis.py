employees = []
def add_employee():
    name = input("Enter Employee Name: ")
    name=name.capitalize()
    salary = input("Enter Employee Salary: ")
    department = input("Enter Employee Department: ")
    emp_id = input("Enter Employee ID: ")
    employees.append([name, salary, department, emp_id])
    print(f"Employee {name} added")

def search_employee():
    name = input("Enter Employee Name to Search: ")
    name=name.capitalize()
    found = False

    for emp in employees:
        if emp[0] == name:
            print(f"ID: {emp[3]}, Name: {emp[0]}, Salary: {emp[1]}, Department: {emp[2]}")
            found=True
    if not found:
        print(f"No employee found with name {name}")

def delete_employee():
    emp_id = input("Enter Employee ID to Delete: ")
    for emp in employees:
        if emp[3] == emp_id:
            employees.remove(emp)
            print(f"Employee with ID {emp_id} deleted")
            return
    print(f"No employee found with ID {emp_id}")

def show_all_employees():
    if employees.len()>0:
        for emp in employees:
            print(f"ID: {emp[3]}, Name: {emp[0]}, Salary: {emp[1]}, Department: {emp[2]}")
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
        print("INVALID CHOICE.")
