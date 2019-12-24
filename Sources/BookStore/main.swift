// Create a server with Swift Package Manager
// https://www.kitura.io/docs/getting-started/create-server-spm

// HeliumLogger
// https://www.kitura.io/docs/logging/helium-logger

import Application
import HeliumLogger
import LoggerAPI

HeliumLogger.use(.debug)

do {
	let app = try App()
	try app.run()
} catch {
	Log.error(error.localizedDescription)
}
