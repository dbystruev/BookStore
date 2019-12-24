// Create a server with Swift Package Manager
// https://www.kitura.io/docs/getting-started/create-server-spm

// HeliumLogger
// https://www.kitura.io/docs/logging/helium-logger

// Codable Routing
// https://www.kitura.io/docs/routing/codable-routing

// Kitura OpenAPI
// https://www.kitura.io/docs/routing/kitura-openapi

// Raw Routing
// https://www.kitura.io/docs/routing/raw-routing

import Dispatch
import Kitura
import KituraOpenAPI
import LoggerAPI

public class App {

	let router = Router()
    
    let workerQueue = DispatchQueue(label: "worker")

	public init() throws {}

	func postInit() throws {
		initializeCodableRoutes(app: self)
        initializeRawRoutes(app: self)
        KituraOpenAPI.addEndpoints(to: router)
	}

	public func run() throws {
		try postInit()
		Kitura.addHTTPServer(onPort: 8080, with: router)
		Kitura.run()
	}

    func execute(_ block: (() -> Void)) {
        workerQueue.sync {
            block()
        }
    }
}
