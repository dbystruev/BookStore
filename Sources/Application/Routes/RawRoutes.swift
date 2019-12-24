// Raw Routing
// https://www.kitura.io/docs/routing/raw-routing

func initializeRawRoutes(app: App) {
    app.router.post("/raw") { request, response, next in
        do {
            var book = try request.read(as: Book.self)
            app.execute {
                book.id = App.bookStore.count
                App.bookStore.append(book)
            }
            response.send(book)
        } catch {
            _ = response.send(status: .badRequest)
        }
        next()
    }
    
    app.router.get("/raw") { request, response, next in
        app.execute {
            response.send(App.bookStore)
        }
        next()
    }
    
    app.router.get("/raw/:id") { request, response, next in
        app.execute {
            guard
                let idString = request.parameters["id"],
                let id = Int(idString),
                0 <= id,
                id < App.bookStore.count
                else {
                    let _ = response.send(status: .badRequest)
                    return next()
            }
            response.send(App.bookStore[id])
        }
        next()
    }
}

extension App {
    static var bookStore = [Book]()
}
