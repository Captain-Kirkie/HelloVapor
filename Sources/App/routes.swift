import Vapor

func routes(_ app: Application) throws {
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
    
}
