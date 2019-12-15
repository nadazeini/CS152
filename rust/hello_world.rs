fn f(x: Box<i32>) { 
    println!("{}", x);
}
fn double(n: i32) -> i32{
    n*2 //no semi colon
}

fn main(){

    let a = Box::new(42_i32); 
    println!("{}", a);
    
    f(a);
    let x = 55;
    
    let y = double(11);
    println!("{}",y);
}