struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUserDate() -> User {
        User(userName: "Dima", password: "dimama", person: Person(name: "Dima", surname: "kozhemyakin"))
    }
}

struct Person {
    let name: String
    let surname: String
    var fullname: String {
        "\(name) \(surname)"
    }
}

