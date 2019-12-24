// What is routing?
// https://www.kitura.io/docs/routing/what-is-routing

struct Book: Codable {
    var id: Int
    let title: String
    let price: Double
    let genre: String
    
    init(id: Int = 0, title: String = "", price: Double = 0, genre: String = "") {
        self.id = id
        self.title = title
        self.price = price
        self.genre = genre
    }
}
