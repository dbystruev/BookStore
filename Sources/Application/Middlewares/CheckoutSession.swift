//
//  CheckoutSession.swift
//  Application
//
//  Created by Denis Bystruev on 26.12.2019.
//
//  Codable Routing Session
//  https://www.kitura.io/docs/sessions/codable-session

import KituraSession

final class CheckoutSession: TypeSafeSession {
    var sessionId: String                       // Every session must have an id
    var books: [Book]                           // Any codable type
    
    
    /// Create a new empty session
    /// - Parameter sessionId: session's identifier
    init(sessionId: String) {
        self.sessionId = sessionId
        books = []
    }
}

extension CheckoutSession {
    static var sessionCookie: SessionCookie = SessionCookie(name: "Cookie's name", secret: "Secret data used to encrypt the cookie")
    static var store: Store?
}
