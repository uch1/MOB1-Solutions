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


protocol Character {
    var health: Int {get set}
    var strenght: Int {get}
    var aim: Int {get set}
}

struct Henchman: Character {
    var health: Int
    var aim: Int
}

struct Hero: Character {
    var health: Int
    let strenght: Int
    var aim: Int
}

/*:
 ## Restricting Protocols to specific types
 
 We can restrict protocols to specific instance types by using the ```where``` keyword and ```Self``` referring to the conforming instance (Henchman in  the example below)
 
*/

extension Character where Self == Henchman {
    var strenght: Int {
        return 200
    }
}

let stormtropper = Henchman(health: 100, aim: -100)
stormtropper.strenght

/*:
 
 *Notice* how stromtropper has a default strenght of 200 even though we didn't specify it in its initializer or struct defininition?
 
This is because we provided a default implementation of strenght for only henchmen
*/



/*:
 ## Constraining Protocols
 We can constrain protocols to classes were we are only going to use this protocol on classes
 
 */

protocol TapDetectionDelegate: class {
    func didTapCircle(x: Int, y: Int)
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



/*:
 ## Multiple Protocol Restriction
 
 Remember, protocols are also *types* and we can return them when a type in a function signature is expected
*/

protocol Biped {
    func name() -> String
    func walk()
}

protocol Hairy {
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
// describe(item: Dog()) // error: Dog() doesn't conform to Biped

/*:
 
 ## Challenges
 
 1. a. Create a model of a car, it should have a max speed, number of wheels, doors and model properties.
    b. Generalize the car, create a model for a vehicle which will represent all vehicles, a truck, motocycle & bus are vehicles
 
 2.
 */
<<<<<<< HEAD

=======
// 1.
protocol Car {
    var maxSpeed: Int {get}
    var numberOfWheels: Int {get}
    var numberOfDoors: Int {get}
    var model: String {get}
   
}

struct Truck: Car {
    var maxSpeed: Int
    var numberOfWheels: Int
    var numberOfDoors: Int
    var model: String
}

struct Motocycle: Car {
    var maxSpeed: Int
    var numberOfWheels: Int
    var numberOfDoors: Int
    var model: String
}

struct Bus: Car {
    var maxSpeed: Int
    var numberOfWheels: Int
    var numberOfDoors: Int
    var model: String
}

//2.
>>>>>>> 74bd8e8143312c5cfd45c9be4995aae340e41a43
 protocol CanMakeNoise {
    func makeNoise()
 }
 
<<<<<<< HEAD
 class Elephant {
 
 }
 
 class Pig {
 
 }
 
 class Cow {
 
 }
 
 
 let elephant = Elephant()
 let pig = Pig()
 let cow = Cow()
 
 // let arrayOfNoiseMaker: [CanMakeNoise] = [human, pig, cow]

=======
class Elephant: CanMakeNoise {
    func makeNoise() {
        print("AHHH")
    }
 }
 
class Pig: CanMakeNoise {
    func makeNoise() {
        print("WIIII")
    }
 }
 
class Cow: CanMakeNoise {
    func makeNoise() {
        print("BOOOO")
    }
 }
 
let elephant = Elephant()
let pig = Pig()
let cow = Cow()

let arrayOfNoiseMaker: [CanMakeNoise] = [elephant, pig, cow]

for animal in arrayOfNoiseMaker {
   print(animal.makeNoise())
}
>>>>>>> 74bd8e8143312c5cfd45c9be4995aae340e41a43

/*:
 
 2 a. Uncomment above line and make the code compile. This can be achieved by implementing the `CanMakeNoise` protocol in all the classes above. Think about a noise each class could make and print it to the console using `print`.
 
 b. Iterate over `arrayOfNoiseMaker` and let each object make their noise
 
 */

/*:
 3.
 
 Take at look at the protocol definition for Equatable by Apple:
 
 ```
 public protocol Equatable {
 
  Returns a Boolean value indicating whether two values are equal.
 
  Equality is the inverse of inequality. For any values `a` and `b`,
  `a == b` implies that `a != b` is `false`.
 
  - Parameters:
    - lhs: A value to compare.
    - rhs: Another value to compare.
 public static func ==(lhs: Self, rhs: Self) -> Bool
 }
 ```
 
 Given the Artist struct below, implement the Equatable protocol
 
 ### Hint
 
 With Equatable, you define what makes two instances equal. Imagine you have two colored balls.
 What makes them equal? Is it their colors? Their sizes? Its up to you to determine that.
 
 */

// Used by Artist to determine style of Artist
enum Style: String {
    case impressionism
    case surrealism
    case cubism
    case popArt
}

<<<<<<< HEAD
struct Artist {
=======
struct Artist: Equatable {
>>>>>>> 74bd8e8143312c5cfd45c9be4995aae340e41a43
    let name: String
    let style: Style
    let yearBorn: Int
}

<<<<<<< HEAD
=======
extension Artist {
    static func ==(lhs: Artist, rhs: Artist) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.style == rhs.style &&
            lhs.yearBorn == rhs.yearBorn
    }
}

>>>>>>> 74bd8e8143312c5cfd45c9be4995aae340e41a43
// Example instances of Artists, use for testing your equatable
let monet = Artist(name: "monet", style: .impressionism, yearBorn: 1840)
let dali = Artist(name: "Salvador Dali", style: .surrealism, yearBorn: 1904)
let andy = Artist(name: "Andy Warhol", style: .popArt, yearBorn: 1928)

<<<<<<< HEAD
=======
monet.name == dali.name
andy.name == dali.name
andy.name == andy.name
>>>>>>> 74bd8e8143312c5cfd45c9be4995aae340e41a43

/*:
 
 4. Write an iterator for a 2Dimentional array. Eg. Given [[2,5,9], [0, 4, 2], [6, 8, 3]],
 you should be able to iterate through each element sequentially 2,5,9,0,4,2,6,8,3.
 
 ### Hint
 
 There are some protocols you can leverage in the collection data types to help guide you.
 
 
*/
<<<<<<< HEAD

=======
var twoDimensionalArray = [[2,5,9], [0, 4, 2], [6, 8, 3]]
>>>>>>> 74bd8e8143312c5cfd45c9be4995aae340e41a43


//: [Next](@next)
