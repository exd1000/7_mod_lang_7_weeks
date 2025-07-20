// Week 4, Day 4 – Rust: Error Handling & Testing 🦀⚙️

// Result<T, E> - Standard way to represent recoverable errors
// Option<T> - "Maybe" values. Nullable value with explicit handling. 
// unwrap, expect - Panic-based retrieval (not safe in production)
// panic!() - Immediate crash for unrecoverable errors
// match pattern - Elegant way to branch based on Result or Option
// Unit testing framework - Built-in with #[test] functions


// Day 4 Examples

// Example 1 – Using Result + match
fn safe_divide(a: f64, b: f64) -> Result<f64, String> {
    if b == 0.0 {
        Err("Division by zero".to_string())
    } else {
        Ok(a / b)
    }
}

// IMPLEMENTED BELOW:
    // fn main() {
    //     match safe_divide(10.0, 2.0) {
    //         Ok(result) => println!("Result: {}", result),
    //         Err(e) => println!("Error: {}", e),
    //     }
    // }


// match – Pattern Matching (Like a Better switch)
    // A control structure that lets you destructure and branch on enums like Option or Result.
//    You must cover every possible case, which makes it very safe.

    // let name = Some("Em");

    // match name {
    //     Some(n) => println!("Hi, {}!", n),
    //     None => println!("No name provided."),
    // }


// Example 2 – Option and unwrap_or
fn get_nickname(user: Option<&str>) {
    let name = user.unwrap_or("Anonymous");
    println!("User: {}", name);
}

// unwrap() – Get the Value or Panic
// Extracts the value from Some(value) or Ok(value)
// If it’s None or Err, it panics and crashes the program

    // let name = Some("Em");
    // println!("{}", name.unwrap()); // ✅ OK

    // let none: Option<&str> = None;
    // println!("{}", none.unwrap()); // ❌ PANICS

// unwrap_or() - extracts value or default
// Safer Alternative

    // let fallback = name.unwrap_or("Anonymous");



// Option<T> - "Maybe" values.
    // A type that either holds something (Some) or nothing (None) 

// 🔄 Used for:
// 	•	Return values that might not exist
// 	•	Optional fields
// 	•	Default fallbacks

// let maybe_name: Option<&str> = Some("Em");
// let no_name: Option<&str> = None;



// Example 3 – panic!
fn _crash() {
    panic!("Unexpected fatal error");
}
// prefix unused crash function with _ to avoid rust warnings

// fn crash() {
//     panic!("Unexpected fatal error");
// }


// All helper functions outside main() function 
// & single main() function that actually calls them
fn examples() {
    match safe_divide(10.0, 2.0) {
        Ok(result) => println!("Result: {}", result),
        Err(e) => println!("Error: {}", e),
    }
        get_nickname(Some("Em"));
    // crash(); // Uncomment if you wanna test panic!
}


// Example 4 – Rust Unit Tests
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_addition() {
        assert_eq!(2 + 2, 4);
    }

    #[test]
    #[should_panic(expected = "Division by zero")]
    fn test_divide_panic() {
        let _ = safe_divide(10.0, 0.0).unwrap();
    }
}


// Day 4 Exercises

// Exercise 1 – Safe Integer Parser
// Write a function parse_int(s: &str) -> Result<i32, String>
// 	•	Returns Ok(i32) if valid
// 	•	Returns Err(msg) if it fails

fn parse_int(s: &str) -> Result<i32, String> {
    match s.parse::<i32>() { 
        Ok(num) => Ok(num),
        Err(_) => Err("Not int".to_string()),
    }
}

// s.parse::<i32>() – Convert String to a Number



// Exercise 2 – Email Validator
// Write a function that returns Result<&str, String>:
// 	•	Validates that the email contains '@'
// 	•	Returns error message if invalid
// 	•	Write a match block in main() to handle it

fn validate_email(email: &str) -> Result<&str, String> {
    if email.contains("@") {
        Ok(email)
    } else { 
        Err("invalid email".to_string())
    }

}




// Exercise 3 – Option Fallback
// Write a function get_name(nickname: Option<&str>, username: &str) -> &str
// 	•	Return nickname if present
// 	•	Otherwise return username

fn get_name<'a>(nickname: Option<&'a str>, username: &'a str) -> &'a str {
    // TODO: return nickname if Some, else username
    match nickname {
        Some(eli) => eli,
        None => username,
    }
}


// Exercise 4 – Panic Trigger
// Write a function that panics if the value is negative:
fn assert_positive(n: i32) {
    if n < 0 {
        panic!("Negative value not allowed: {}", n);
    }
}

// Exercise 5 – Test Suite
// Write a #[cfg(test)] block that includes:
// 	•	✅ At least one test using assert_eq!
// 	•	❌ One test that should panic (e.g., divide-by-zero or assert failure)

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_parse_int_valid() {
        assert_eq!(parse_int("42").unwrap(), 42);
        }


    #[test]
    fn test_parse_int_invalid() {
        assert_eq!(parse_int("hi").is_err());
        }


    #[test]
    #[should_panic(expected = "Negative value not allowed")]
    fn test_assert_positive_panic() {
        let _ = assert_positive(-4);
        }
}

fn exercises() {

    match validate_email("hello@gmail.com") {
        Ok(valid) => println!("Valid email: {}", valid),
        Err(e) => println!("Error: {}",e),
    }

    println!("Parsed int: {:?}", parse_int("10"));
    println!("Parsed invalid: {:?}", parse_int("hi"));

    let username = get_name(None, "eli");
    println!("Name fallback: {}", username);

    assert_positive(10);
    assert_positive(-1);
}


fn main() {
    examples();
    exercises();
}