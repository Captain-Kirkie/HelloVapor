import Vapor
import Foundation
import Network

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
    
    app.get("counter", ":number") { req async -> CounterJson in
        let num = try! req.parameters.require("number")
        guard let val = Int(num) else {
            return CounterJson(count: nil)
        }
        return CounterJson(count: Int(val))
    }
    
    // MARK: POST
    app.post("info") { req -> InfoResponse in
        let data = try req.content.decode(InfoData.self)
        return InfoResponse(request: data)
    }
    
    app.post("user-info") { req  -> User in
        let user = try! req.content.decode(User.self)
        print(type(of: user))
        return user
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

struct CounterJson: Content {
    let count: Int?
}

struct User: Content {
    var name: String = "default"
    var age: Int
}

// MARK: Helper functions
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
