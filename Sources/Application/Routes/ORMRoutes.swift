// Swift Kuery ORM
// https://www.kitura.io/docs/databases/orm
// brew install postgresql // apt install libpq-dev; sudo -u postgres -i

import KituraContracts
import LoggerAPI
import SwiftKueryORM
import SwiftKueryPostgreSQL

func initializeORMRoutes(app: App) {
    // Connect to database
    let pool = PostgreSQLConnection.createPool(
        host: "localhost",
        port: 5432,
        options: [
            .databaseName("bookdb"),
            .userName("bookuser"),
            .password("bookpassword")
        ],
        poolOptions: ConnectionPoolOptions(initialCapacity: 10, maxCapacity: 50)
    )
    Database.default = Database(pool)
    
    // Create a Book table
    do {
        try Book.createTableSync()
        Log.debug("Created table Book")
    } catch {
        Log.error("Failed to create table: \(error)")
    }
    
    app.router.post("/book", handler: app.saveBook)
    app.router.get("/books", handler: app.findBooks)
    app.router.get("/book", handler: app.findBook)
}

extension App {
    func saveBook(book: Book, completion: @escaping (Book?, RequestError?) -> Void) {
        book.save(completion)
        Log.debug("")
    }
    
    func findBooks(completion: @escaping ([Book]?, RequestError?) -> Void) {
        Book.findAll(completion)
        Log.debug("")
    }
    
    func findBook(id: Int, completion: @escaping (Book?, RequestError?) -> Void) {
        Book.find(id: id, completion)
        Log.debug("")
    }
}
