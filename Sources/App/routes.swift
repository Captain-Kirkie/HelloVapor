import Vapor

func routes(_ app: Application) throws {
    // MARK: GET
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("hello", "vapor") { req async -> String in
        "Hello Vapor"
    }
    // dynamic...
    app.get("hello", ":name") { req async -> String in
        let name = try! req.parameters.require("name")
        return "Hello \(name)"
    }
    
    // MARK: POST
    app.post("info") { req -> InfoResponse in
        let data = try req.content.decode(InfoData.self)
        return InfoResponse(request: data)
    }
}

// MARK: Structs
struct InfoData: Content {
    let name: String
}
 // convert to json
struct InfoResponse: Content {
    let request: InfoData
}


