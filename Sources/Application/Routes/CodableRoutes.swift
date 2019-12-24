// Codable Routing
// https://www.kitura.io/docs/routing/codable-routing

import KituraContracts  // for RequestError
import LoggerAPI

func initializeCodableRoutes(app: App) {
    app.router.post("/books", handler: app.postHandler)
    app.router.get("/books", handler: app.getAllHandler)
    app.router.get("/books", handler: app.getOneHandler)
}

extension App {
    static var codableStore = [Book]()
    
    func postHandler(book: Book, completion: (Book?, RequestError?) -> Void) {
        var book = book
        execute {
            book.id = App.codableStore.count
            App.codableStore.append(book)
        }
        completion(book, nil)
    }
    
    func getAllHandler(completion: ([Book]?, RequestError?) -> Void) {
        execute {
            completion(App.codableStore, nil)
        }
    }
    
    func getOneHandler(id: Int, completion: (Book?, RequestError?) -> Void) {
        execute {
            guard 0 <= id, id < App.codableStore.count else {
                return completion(nil, .notFound)
            }
            completion(App.codableStore[id], nil)
        }
    }
}
