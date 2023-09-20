use std::io::Read;

fn main() {
    let filename = std::env::args().next().unwrap();

    loop {
        test1();
        test2(&filename);
    }
}

fn test1() {
    std::thread::sleep(std::time::Duration::from_nanos(200));
}

fn test2(filename: &str) {
    let mut f = std::fs::File::open(filename).unwrap();
    let mut buffer = Vec::new();
    f.read_to_end(&mut buffer).unwrap();
}