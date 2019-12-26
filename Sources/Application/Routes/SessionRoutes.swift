//
//  SessionRoutes.swift
//  Application
//
//  Created by Denis Bystruev on 26.12.2019.
//
//  Codable Routing Session
//  https://www.kitura.io/docs/sessions/codable-session

import KituraContracts
import KituraSession

func initializeSessionRoutes(app: App) {
    app.router.get("/cart", handler: app.getSessionHandler)
    app.router.post("/cart", handler: app.postSessionHandler)
}

extension App {
    func getSessionHandler(session: CheckoutSession, completion: ([Book]?, RequestError?) -> Void) {
        completion(session.books, nil)
    }
    
    func postSessionHandler(session: CheckoutSession, book: Book, completion: @escaping (Book?, RequestError?) -> Void) {
        session.books.append(book)
        session.save()
        completion(book, nil)
    }
}
