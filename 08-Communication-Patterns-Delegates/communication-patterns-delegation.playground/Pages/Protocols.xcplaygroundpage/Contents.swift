import Foundation

/*:
 
 # Protocols
 
 A protocol defines a blueprint of methods, properties, and other requirements that
 suit a particular task or piece of functionality.
 
 The protocol can then be adopted by a class, structure, or enumeration to provide 
 an actual implementation of those requirements. Any type that satisfies the 
 requirements of a protocol is said to conform to that protocol.

 
 ## Defining and conforming to a Protocol
 
*/

enum Food {
    case fish
    case sandwich
}

protocol Mammal {
    func eat() -> Food
}

struct Orka: Mammal {
    func eat() -> Food {
        return Food.fish
    }
}

class Human: Mammal {
    func eat() -> Food {
        return Food.sandwich
    }
}

let peter = Human()
peter.eat()

let myOrka = Orka()
myOrka.eat()


/*:
 Protocols can also have required properties like variables
*/

protocol Sandwich {
    var diameter: Int {get set}
}


/*
 ## Inheritance and Protocols
 
 Protocols can be inherited by classes, structs or other protocols
 
 A class, struct or protocol can inherit multiple protocols
 
 A class on the other hand can only inherit from one Super class(Base class)
 
*/

// Protocol Definitions
protocol Vertibrates {}
protocol Flyable {}
protocol CanSwim {}

// Protocol Inheritance
protocol Bird: Flyable, Vertibrates {}
class Fish: Vertibrates, CanSwim {}
struct Amphibian: Vertibrates, CanSwim {}

/*:
 
 ## Protocol Extensions
 
 Protocols on their own do not have any functionality, they define contracts
 that an conformer must adhere to. To add functionality to a protocol, we can
 extent it.
 
 */


enum ChangeType {
    case increase
    case decrease
}

struct Health {
    var value: Int = 100
    var changeAmount: Int = 10
    
    mutating func change(type: ChangeType) {
        switch type {
        case .increase:
            value += changeAmount
        case .decrease:
            value -= value
        }
    }
}

protocol Character {
    var health: Health {get set}
    
    func changeHealth(character: Character, type: ChangeType) -> Character
}

extension Character {
    func changeHealth(character: Character, type: ChangeType) -> Character {
        return character
    }
}

struct Henchman: Character {
    var health: Health = Health()
}

struct Hero: Character, Hittable {
    var health: Health = Health()
}

protocol Hittable {
    func hit(target: Character) -> Character
    func takeDamage()
}

extension Hittable {
    func hit(target: Character) -> Character {
        return target.changeHealth(character: target, type: .decrease)
    }

    func takeDamage() {}
}


/*:
 ## Protocol methods and conformation, Required vs Optional
 
 By default when you conform to a protocol, you are required to implement all methods defined by the protocol.
 Using the @optional keyword, we can mark a method or variable in a protocol as an optional method
 
 To to this, we must mark our protocol with @objc, even though we are not interacting with Objective-C.
 Doing this imposes some restrictions, one of them being that we can only use the protocol on reference types.
 
*/

@objc protocol Purchasable {
    @objc optional var discount: Double {get set}
    @objc optional func purchase()
}



/*
 ## Multiple Protocol Restriction
 
 Remember, protocols are also *types* and we can return then when a type in a function signature is expected
*/

protocol Biped{
    func name() -> String
    func walk()
}

protocol Hairy{
    func hairColor() -> String
}

class Dog: Hairy {
    func hairColor() -> String {
        return "White"
    }
}

class Ostrich: Biped, Hairy {
    func walk() {}
    
    func name() -> String {
        return "Ostrich"
    }
    
    func hairColor() -> String {
        return "Black"
    }
}

func describe(item: Biped & Hairy) -> String {
    return("\(item.name()) 's hair color is \(item.hairColor())))")
}

//: Ostrich is *Biped* and *Hairy*
describe(item: Ostrich())

//: Dog does not conform to *Biped* so it wont be accepted into the describe function
// describe(item: Dog()) // error: Dog() doesn't conform to Describable

/*:
 
 ## Challenges
 
 1. Create a model of a car, it should have a max speed, number of wheels, doors and model properties.
 2. Generalize the car, create a model for a vehicle, a car & motocycles are vehicles
 3.
 
 Take at look at the protocol definition for Equatable by Apple:
 
 public protocol Equatable {
 
 /// Returns a Boolean value indicating whether two values are equal.
 ///
 /// Equality is the inverse of inequality. For any values `a` and `b`,
 /// `a == b` implies that `a != b` is `false`.
 ///
 /// - Parameters:
 ///   - lhs: A value to compare.
 ///   - rhs: Another value to compare.
 public static func ==(lhs: Self, rhs: Self) -> Bool
 }
 
 
 Given the Artist struct below, implement the Equatable protocol
 
 ### Hint
 
 With Equatable, you define what makes two instances equal. Imagine you have two colored balls.
 What makes them equal? Is it their colors? Their sizes? Its up to you to determine that.
 
 */

protocol Vehicle {
    var maxSpeed: Int {get set}
    var numberOfWheels: Int {get set}
    var doors: Int {get set}
    var model: String {get set}
}

struct Car: Vehicle {
    var maxSpeed: Int
    var numberOfWheels: Int
    var doors: Int
    var model: String
}

struct Motorcycle: Vehicle {
    var maxSpeed: Int
    var numberOfWheels: Int = 0
    var doors: Int = 0
    var model: String
    
}

//3
// Used by Artist to determine style of Artist
enum Style: String {
    case impressionism
    case surrealism
    case cubism
    case popArt
}

public protocol Equatable {
    static func ==(lhs: Self, rhs: Self) -> Bool
}

struct Artist: Equatable {
    let name: String
    let style: Style
    let yearBorn: Int
    
    init(name: String, style: Style, yearBorn: Int) {
        self.name = name
        self.style = style
        self.yearBorn = yearBorn
    }
}

extension Artist {
    static func ==(lhs: Artist, rhs: Artist) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.style == rhs.style &&
            lhs.yearBorn == rhs.yearBorn
    }
}

// Example instances of Artists, use for testing your equatable
let monet = Artist(name: "monet", style: .impressionism, yearBorn: 1840)
let dali = Artist(name: "Salvador Dali", style: .surrealism, yearBorn: 1904)
let andy = Artist(name: "Andy Warhol", style: .popArt, yearBorn: 1928)

//: ### Test your equatable protocol Below HERE
monet.name == dali.name
monet.style == dali.style
monet.yearBorn == dali.yearBorn
andy.name == monet.name
andy.style == monet.style
andy.yearBorn == monet.yearBorn
monet.name == monet.name
monet.style == monet.style
monet.yearBorn == monet.yearBorn


/*:
 4. Write an iterator for a 2Dimentional array. Eg. Given [[2,5,9], [0, 4, 2], [6, 8, 3]],
 you should be able to iterate through each element sequentially 2,5,9,0,4,2,6,8,3.
 
 ### Hint
 
 There are some protocols you can leverage in the collection data types to help guide you.
*/
//: [Next](@next)

var twoDimArray = [[2,5,9], [0, 4, 2], [6, 8, 3]]
var anotherTwoDimArray: [Int] = []

for x in 0..<twoDimArray.count {
    for y in 0..<twoDimArray[x].count {
        anotherTwoDimArray.append(twoDimArray[x][y])
    }
}
print(anotherTwoDimArray)














