use std::env;
use std::fs;
use std::io::Write;
use std::process::Command;

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() == 1 {
        let file = fs::read_to_string("/home/hi/.style").unwrap();
        let trimmed = file.trim();
        if trimmed == "dark" {
            Command::new("foot").spawn().unwrap();
        } else {
            Command::new("foot")
                .args(["-c", "/home/hi/.config/foot/light.ini"])
                .spawn()
                .unwrap();
        }
    } else {
        let background = args[1].clone();
        if background == "dark" {
            Command::new("theme.sh")
                .args(["jellybeans"])
                .spawn()
                .unwrap();
        } else {
            Command::new("theme.sh")
                .args(["one-half-light"])
                .spawn()
                .unwrap();
        }
        let mut file = fs::File::create("/home/hi/.style").unwrap();
        file.write_all(&mut background.as_bytes()).unwrap();
    }
}
