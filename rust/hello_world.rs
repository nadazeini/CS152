fn main() {
    println!("Hello World");
    println!("{} + {} = {} ",2,3,5);
    println!("< {0} > {1} < {0} >","h1","Hello World!"); //<h1> hello world!</h1>
    println!("<{tagname} { attrname} = '{attrval}'> {body} </{tagname}>",
                tagname = "a",
                attrname = "href",
                attrval ="https://www.rust-lang.org/",
                body = "Rust website" ); //<a href = rust ...
    let a = 1;
    let b = 2;
    let c = foo(a);
    fn foo(x: i32) -> i32 {
        //return x+3; in java
        //different in rust
        x + 3
        //expects someting after semicolon so dont put semi colon
        
    }
}