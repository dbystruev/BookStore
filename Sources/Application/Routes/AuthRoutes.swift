//
//  AuthRoutes.swift
//  Application
//
//  Created by Denis Bystruev on 26.12.2019.
//
//  HTTP Basic Authentication with Codable routes
//  https://www.kitura.io/docs/authentication/basic-authentication

import Kitura
import KituraContracts
import Credentials
import CredentialsHTTP
import LoggerAPI

func initializeAuthRoutes(app: App) {
    app.router.get("/basic", handler: app.protectedGetHandler)
}

// MARK: - Auth Routes
extension App {
    func protectedGetHandler(user: BasicAuth, respondWidth: (Book?, RequestError?) -> Void) {
        Log.info("Authentificated \(user.id)")
        let secretBook = Book(id: 451, title: "1984", price: 9001, genre: "Science Fiction")
        respondWidth(secretBook, nil)
    }
}
