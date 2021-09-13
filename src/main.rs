fn main() {
    println!("Hello, world!");
    println!("42");
}

#[cfg(test)]
mod tests {
    #[test]
    assert_eq!(21 + 21, 42);
}
