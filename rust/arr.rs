fn main() {
  let mut a: [i32; 10] = [0;10]; //type i32 10 elements 
  let mut i = 0;
  while i <= 10 {
    println!("Accessing {}", i);
    a[i] = i as i32;
    i = i + 1;
  }
}

