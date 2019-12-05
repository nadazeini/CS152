
 fn print_arr(a: &[i32]) -> () {
  for i in a {
    print!("{} ", i);
  }
  println!("");
}

fn quick_sort<T,F>(v: &mut [T], f: &F) 
    where F: Fn(&T,&T) -> bool
{
    let len = v.len();
    if len >= 2 {
        let pivot = partition(v, f);
        quick_sort(&mut v[0..pivot], f);
        quick_sort(&mut v[pivot + 1..len], f);
    }
}
 //partition
fn partition<T,F>(v: &mut [T], f: &F) -> usize 
    where F: Fn(&T,&T) -> bool
{
    let len = v.len();
    let pivot = len / 2;
    let last= len - 1;
 
    v.swap(pivot, last);
 
    let mut store = 0;
    for i in 0..last {
        if f(&v[i], &v[last]) {
            v.swap(i, store);
            store += 1;
        }
    }
 
    v.swap(store, len - 1);
    store
}
//testing
fn main() {

    let mut numbers = [14, 33, -2, -91, 0, 8, 2, 3, 71, 1];
    print_arr(&numbers[..]);
    quick_sort(&mut numbers, &|x,y| x < y);
    print_arr(&numbers[..]);
 
}