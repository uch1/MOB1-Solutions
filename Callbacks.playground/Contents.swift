import UIKit
import PlaygroundSupport

//: Simple Callback, Call function later when ready

func doLater(callback: (Double) -> Void) {
    
    // Some intensive task that will take time to complete
    let time = 7.0
    Thread.sleep(forTimeInterval: time)
    callback(time)
}

doLater { time in
    print("Reader after \(time) seconds")
}


// Create typealias for ProductCallback

class Merchant {
    // Define ProductCallback / Means of communication
    
    init() {
    }
    
    // Action we want to call the callback on
}

class Customer {
    
    init() {
    }
    
    // Handle Customer recieving merchant changes
}

let vendor = Vendor()
let monger = Monger()

// Set Callback

// Vend products


//: # Examples from the iOS SDK

//: ## Animations

// Boilerplate code
let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))

let grayView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
grayView.backgroundColor = UIColor.gray
grayView.center = containerView.center
containerView.addSubview(grayView)

/*:
 
 UIView.animate takes in two closures, one before the animation starts to set it up, and another closure to be called when the animation is completed
 */
UIView.animate(withDuration: 0.45, delay: 0, options: [.autoreverse, .repeat], animations: {

    // A Closure/Function to handle the interpolation of values in animation
    grayView.backgroundColor = UIColor.cyan
    grayView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    grayView.transform = CGAffineTransform(rotationAngle: .pi / 2)

}) { (completed) in

    // Another Closure to handle when animation is complete
}


//: ## UIKit: UIAlertController

let alertVC = UIAlertController(title: "My Title", message: "My message", preferredStyle: .actionSheet)
let alertAction = UIAlertAction(title: "Ok", style: .default) { (action) in
    // Do something to handle when action was triggered
    
}

alertVC.addAction(alertAction)



// Extra material to make this playground work
PlaygroundPage.current.liveView = containerView
PlaygroundPage.current.needsIndefiniteExecution = true
