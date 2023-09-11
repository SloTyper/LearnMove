script {
  use 0x42::Company;
  use std::debug;

  fun do_stuff() {
    let info = Company::get_info();
    debug:: print(&info);
  }
}