import UIKit
import PlaygroundSupport

/*:
 # Delegation

 Delegation is one of many communication patterns used in iOS to distribute information.
 Delegation is one-to-one, which means that only two participants can engage in delegation
 */

protocol TapDetectionDelegate: class {
    func didTapCircle(at: CGPoint)
}

/*:
We can constrain protocols to classes were we are only going to use this protocol on classes
 
 When creating a delegate, we only want a blueprint of the contract; functions that describe what information is being passed from the delegate
*/


// MARK: - Delegates
protocol BusStopDelegate: class {
    func busTookOff(from stop: String)
    func busReachedDestination(destination: String)
}

class Bus {
    var name: String = "Market & 6th  Bus"
    
    // BusStopDelegate/Supporter | doesn't conform
    weak var delegate: BusStopDelegate?
    
    func takeOff() {
        delegate?.busTookOff(from: "Mission St & 9th St")
    }
    
    func reachedDestination() {
        delegate?.busReachedDestination(destination: "Valencia St & Guerro St")
    }
}

class BusControlCenter: BusStopDelegate {
    
    func busTookOff(from stop: String) {
        print("Bus took off from \(stop)")
    }
    
    func busReachedDestination(destination: String) {
        print("Bus reached destination \(destination)")
    }
}

let bus = Bus()
let controlCenter = BusControlCenter()

//:  ### Setting the bus's delegate to be the bus control center, which conform to the BusStopDelegate
bus.delegate = controlCenter

// Let the bus take off
bus.takeOff()
bus.reachedDestination()

//: Lets take a look at how this looks like in a diagram

//: ![Delegation](delegation.png)


//: [Next Topic](@next)
// Delegations
protocol AssignWorkDelegate: class {
    func assignWork(task: String)
    func assignDeadline(date: String)
}

class CEO {
    var work: String = "Here's the task for the day"
    
    //Supporter/Assistant/Delegate
    weak var delegate: AssignWorkDelegate?
    
    //Assistant explains the task to the intern
    func giveTask() {
        delegate?.assignWork(task: "Fix the UI designs and home button")
    }
    
    func giveDeadline() {
        delegate?.assignDeadline(date: "This should be completed by Friday at 9pm")
    }
}

class Intern: AssignWorkDelegate {
    // Assistant assign the task and deadline for the intern
    func assignWork(task: String) {
        print("Today's task: \(task)")
    }
    
    func assignDeadline(from date: String) {
        print("Deadline: \(date)")
    }
}

let ceo = CEO()
let intern = Intern()

// Assistant communicates with the CEO after assigning a task for the intern
// Intern conforms the Assistant(AssignWorkDelegate)
ceo.delegate = intern
ceo.giveTask()
ceo.giveDeadline()
