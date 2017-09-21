/*:
 ![Make School Banner](./swift_banner.png)
 # Create something cool
 
 - experiment: Use everything you learned to draw something awesome! See below for a few more functions you can use to bring your art to life!
 
 ## Drop and lift the pen
 
 - callout(Drop the pen): `penDown()`
 
 
 - callout(Lift the pen): `penUp()`
 
 
 - note: The pen starts out down.
 
 ## Moving the pen
 
 - callout(Move by a number of steps): `move(steps: Int)`
 
 
 - callout(Move directly to coordinates): `moveTo(x: Int, y: Int)`
 
 
 - callout(Rotate heading by an angle): `rotate(degrees: Int)`
 
 ## Change the pen
 
 - callout(Set color of pen): `setColor(red: Double, green: Double, blue: Double)`
 
 
 - note: Each value should be between 0 and 1. eg. `setColor(red: 0.0, green: 0.0, blue: 0.0)` would change the pen to be black. `setColor(red: 1.0, green: 0.0, blue: 0.0)` would change the pen to be red.
 
 
 - callout(Set thickness of pen): `set(thickness: Double)`
 
 */
//: [Previous](@previous)
/*:
 
 - callout(Challenge): Draw something awesome in the space below!
 
 */
func dropAndLiftThePen(movement: String) {
    if movement == "up" {
        penUp()
    } else if movement == "down" {
        penDown()
    }
}
dropAndLiftThePen(movement: "down")

func movingThePen(steps: Int, x_direction: Int, y_direction: Int, angle: Int) {
    move(steps: steps)
    moveTo(x: x_direction, y: y_direction)
    rotate(degrees: angle)
}
movingThePen(steps: 50, x_direction: 100, y_direction: 150, angle: 30)

func changeThePen(red: Double, green: Double, blue: Double, thickness: Int) {
    setColor(red: red, green: green, blue: blue)
    set(thickness: Double(thickness))
}
changeThePen(red: 0.0, green: 1.0, blue: 0.80, thickness: 6)





















































































//: This is setup code to make the live visualization work!
Pen.delay = 0.1
import PlaygroundSupport
import Foundation
let results = DrawingScene.setup()
PlaygroundPage.current.liveView = results
