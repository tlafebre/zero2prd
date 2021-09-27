use std::net::TcpListener;
use zero2prd::startup::run;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let listener = TcpListener::bind("127.0.0.1:0").expect("Failed to bind random port");
    let port = listener.local_addr().unwrap().port();

    println!("Server running on port: {}", port);
    run(listener)?.await
}
