import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectMustache

// Create HTTP server.
let server = HTTPServer()

// Register your own routes and handlers
var routes = Routes()

// Adding a route to handle the root list
routes.add(method: .get, uri: "/", handler: {
	request, response in

	// Setting the response content type explicitly to text/html
	response.setHeader(.contentType, value: "text/html")
	// Setting the body response to the generated list via Mustache
	mustacheRequest(
		request: request,
		response: response,
		handler: IndexHandler(),
		templatePath: request.documentRoot + "/index.mustache"
	)
	// Signalling that the request is completed
	response.completed()
	}
)

// Adding a route to handle the root list
routes.add(method: .post, uri: "/new", handler: {
	request, response in

	// Setting the response content type explicitly to text/html
	response.setHeader(.contentType, value: "text/html")
	// Setting the body response to the generated list via Mustache

	mustacheRequest(
		request: request,
		response: response,
		handler: NewTaskHandler(),
		templatePath: request.documentRoot + "/index.mustache"
	)

	// Signalling that the request is completed
	response.completed()
	}
)

// Adding a route to handle the root list
routes.add(method: .post, uri: "/done", handler: {
	request, response in

	// Setting the response content type explicitly to text/html
	response.setHeader(.contentType, value: "text/html")
	// Setting the body response to the generated list via Mustache

	mustacheRequest(
		request: request,
		response: response,
		handler: TaskDoneHandler(),
		templatePath: request.documentRoot + "/index.mustache"
	)

	// Signalling that the request is completed
	response.completed()
	}
)
// Add the routes to the server.
server.addRoutes(routes)

// Set a listen port of 8181
server.serverPort = 8181

// Set a document root.
// This is optional. If you do not want to serve static content then do not set this.
// Setting the document root will automatically add a static file handler for the route 
server.documentRoot = "./webroot"

do {
	// Launch the HTTP server.
	try server.start()
} catch PerfectError.networkError(let err, let msg) {
	print("Network error thrown: \(err) \(msg)")
}
