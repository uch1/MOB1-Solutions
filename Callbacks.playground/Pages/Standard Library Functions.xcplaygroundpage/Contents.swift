// Standard Library FunctionsLibrary

let values = [1,2,3,4,5]

var newArray = Array<Int>()

for number in values {
    newArray.append(number * 2)
}

//  MAP
// The map function allows us to apply a transformation to each element in an array. Map is a declarative approach

//let doubledNumbers = values.map { $0 * 2 }
//
//extension Array {
//    func customMap<T>(_ transform: (Element) -> T) -> [T] {
//        var result = [T]()
//
//        for x in self {
//            result.append(transform(x))
//        }
//
//        return result
//    }
//}

//let integerValues = ["1","2","3","4","5"].customMap { Int($0) }
//
///***************/
//import Foundation
//
//struct Formatter {
//    static let formatter = DateFormatter()
//
//    static func date(from string: String) -> Date? {
//        formatter.dateFormat = "d MMM yy"
//        return formatter.date(from: string)
//    }
//}
//
//let dateStrings = ["20 Oct 1978", "11 Jan 1947", "28 Mar 2002"]
//
//let dates = dateStrings.customMap { Formatter.date(from: $0) }
//print(dates)

// FLAT MAP
// Where map applied a transformation function to elements in an array, flatMap let's us do the same thing on a nested array.
struct Post {
    var content: String
    var tags: [String]
}

let blog = [
    Post(content: "Hello, world", tags: ["first", "programming"]),
    Post(content: "Just another short post", tags: ["general"])
]

let tags = blog.flatMap { $0.tags }

extension Array {
    func customFlatMap<T>(_ transform: (Element) -> [T]) -> [T] {
        var result = [T]()
        
        for x in self {
            result.append(contentsOf: transform(x))
        }
        return result
    }
}

// signature of  custom map(): func map<T>(_ transform: (Element) -> T) -> [T]
// signature of actual map(): func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]

struct Account {
    let username: String
    let billingAddress: String?
}

let allUsers = [
    Account(username: "pasanpr", billingAddress: nil),
    Account(username: "benjakuben", billingAddress: "7108 Calderwood Drive"),
    Account(username: "uchenna12", billingAddress: nil),
    Account(username: "spiderman1", billingAddress: "7109 Calderwood Drive")
]

let validAddresses = allUsers.flatMap { $0.billingAddress}.count




















