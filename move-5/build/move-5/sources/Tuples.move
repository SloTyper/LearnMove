module 0x42::Tuples {
  use std::debug;

  fun lots_of_things(): (u8, vector<u8>, bool) {
    let x = 0;
    let name = b"Harish";
    let truth = true;
    return (x, name, truth)
  }

  fun must_be_odd(num: u8): bool {
    assert!(num % 2 == 1, 88);
    return true
  }

  fun must_be_even(num: u8): bool {
    if(num % 2 != 0)
    abort 9;
    return true
  }

  #[test]
  fun test_lots_of_things() {
    let (x, name, truth) = lots_of_things();
    debug::print(&x);
    debug::print(&name);
    debug::print(&truth);
  }

  #[test]
  fun test_must_be_odd() {
    let ans = must_be_odd(21);
    assert!(ans == true, 0);
  }

  #[test]
  fun test_must_be_even() {
    let ans = must_be_even(21);
    assert!(ans == true, 0);
  }
}