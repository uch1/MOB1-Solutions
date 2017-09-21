
/*:

 ## All working?

 - callout(Challenge): Once you have the resizable `drawSquare` function working, do the same for `drawTriangle`, `drawPentagon`, and `drawHexagon` below.

 */
func drawTriangle() {
    let angle = 360/3
    
    moveFifty()
    rotate(degrees: angle)
    moveFifty()
    rotate(degrees: angle)
    moveFifty()
}

func drawPentagon() {
    let angle = 360/5
    
    moveFifty()
    rotate(degrees: angle)
    moveFifty()
    rotate(degrees: angle)
    moveFifty()
    rotate(degrees: angle)
    moveFifty()
    rotate(degrees: angle)
    moveFifty()
}

func drawHexagon() {
    let angle = 360/6
    
    moveFifty()
    rotate(degrees: angle)
    moveFifty()
    rotate(degrees: angle)
    moveFifty()
    rotate(degrees: angle)
    moveFifty()
    rotate(degrees: angle)
    moveFifty()
    rotate(degrees: angle)
    moveFifty()
}











//: [Previous](@previous) | [Next](@next)


















































//: ### This is setup code to make the live visualization work!
Pen.delay = 1
import PlaygroundSupport
import Foundation
let results = DrawingScene.setup()
PlaygroundPage.current.liveView = results
