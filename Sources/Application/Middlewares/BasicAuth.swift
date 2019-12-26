//
//  BasicAuth.swift
//  Application
//
//  Created by Denis Bystruev on 26.12.2019.
//
//  HTTP Basic Authentication with Codable routes
//  https://www.kitura.io/docs/authentication/basic-authentication

import Credentials
import CredentialsHTTP
import LoggerAPI

public struct BasicAuth: TypeSafeHTTPBasic {
    public static let authenticate = ["username": "password"]
    
    public static func verifyPassword(username: String, password: String, callback: @escaping (BasicAuth?) -> Void) {
        if let storedPassword = authenticate[username], storedPassword == password {
            callback(BasicAuth(id: username))
        } else {
            callback(nil)
        }
    }
    
    public var id: String
}
