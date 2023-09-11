module 0x42::Company {
  use std::vector;

  const CONTRACT:address = @0x42;

  struct Employees has store, key, drop{
    people: vector<Employee>,
  }

  struct Employee has store, key, drop, copy{
    name: vector<u8>,
    age: u8,
    income: u64,
  }

  public fun create_employee(_employee: Employee, _employees: &mut Employees): Employee {
    let newEmployee = Employee {
      name: _employee.name,
      age: _employee.age,
      income: _employee.income,
    };

    add_employee(_employees, newEmployee);
    return newEmployee
  }

  public fun add_employee(_employees:&mut Employees, _employee: Employee){
    vector::push_back(&mut _employees.people, _employee);
  }

  public fun increase_income(employee: &mut Employee, bonus: u64): &mut Employee {
    employee.income = employee.income + bonus;
    return employee
  }

  public fun decrease_income(employee: &mut Employee, penalty: u64): &mut Employee {
    employee.income = employee.income - penalty;
    return employee
  }

  public fun multiply_income(employee: &mut Employee, factor: u64): &mut Employee {
    employee.income = employee.income * factor;
    return employee
  }

  public fun divide_income(employee: &mut Employee, divisor: u64): &mut Employee {
    employee.income = employee.income / divisor;
    return employee
  }

  public fun is_employee_age_even(employee: Employee, ): bool {
    let isEven: bool;

    if(employee.age % 2 == 0) {
      isEven = true;
    }
    else {
      isEven = false;
    };
    return isEven
  }

  #[test]
  fun test_create_employee() {
    let harish = Employee {
      name: b"Harish",
      age: 21,
      income: 1000,
    };

    let employees = Employees {
      people: (vector[harish])
    };

    let createdEmployee = create_employee(harish, &mut employees);
    assert!(createdEmployee.name == b"Harish", 0);
  }

  #[test]
  fun test_increase_income() {
    let harish = Employee {
      name: b"Harish",
      age: 21,
      income: 1000,
    };

    let employees = Employees {
      people: (vector[harish])
    };

    let createdEmployee = create_employee(harish, &mut employees);
    let increasedEmployeeIncome = increase_income(&mut createdEmployee, 1000);
    assert!(increasedEmployeeIncome.income == 2000, 0);
  }

  #[test]
  fun test_decrease_income() {
    let harish = Employee {
      name: b"Harish",
      age: 21,
      income: 1000,
    };

    let employees = Employees {
      people: (vector[harish])
    };

    let createdEmployee = create_employee(harish, &mut employees);
    let decreasedEmployeeIncome = decrease_income(&mut createdEmployee, 200);
    assert!(decreasedEmployeeIncome.income == 800, 0);
  }

  #[test]
  fun test_multiply_income() {
    let harish = Employee {
      name: b"Harish",
      age: 21,
      income: 1000,
    };

    let employees = Employees {
      people: (vector[harish])
    };

    let createdEmployee = create_employee(harish, &mut employees);
    let multipliedEmployeeIncome = multiply_income(&mut createdEmployee, 3);
    assert!(multipliedEmployeeIncome.income == 3000, 0);
  }

  #[test]
  fun test_divide_income() {
    let harish = Employee {
      name: b"Harish",
      age: 21,
      income: 1000,
    };

    let employees = Employees {
      people: (vector[harish])
    };

    let createdEmployee = create_employee(harish, &mut employees);
    let dividedEmployeeIncome = divide_income(&mut createdEmployee, 10);
    assert!(dividedEmployeeIncome.income == 100, 0);
  }

  #[test]
  fun test_even_age() {
    let harish = Employee {
      name: b"Harish",
      age: 21,
      income: 1000,
    };

    let employees = Employees {
      people: (vector[harish])
    };

    let createdEmployee = create_employee(harish, &mut employees);
    let employeeAgeEven = is_employee_age_even(createdEmployee);
    assert!(employeeAgeEven == false, 0);
  }
}