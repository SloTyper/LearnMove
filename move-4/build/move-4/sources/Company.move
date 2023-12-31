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

  struct Info has drop {
    company_name: vector<u8>,
    owns: vector<u8>
  }

  public fun get_info(): Info {
    let sisterCompanyName = 0x42::SisterCompany::get_company_name();

    let info = Info {
      company_name: b"The Company",
      owns: sisterCompanyName
    };

    return info
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
}