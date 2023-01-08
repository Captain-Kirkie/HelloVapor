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
    
    app.get("date") { req async -> String in
        let currentDate = formatDate()
        return currentDate
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

func formatDate() -> String {
    let months : [String] = ["January","Febrary","March","April","May","June","July","August","September","October","November","December"]
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    let month = calendar.component(.month, from: date)
    let day = calendar.component(.day, from: date)
    let year = calendar.component(.year, from: date)
    return "today is \(months[month - 1]) \(day) \(year) \(hour):\(minutes)"
}
