//: Playground - noun: a place where people can play

import UIKit
import Foundation

/*:
 # Notifications
 
 Type: One to many
 ### How it works
 
 (1) A sender(creator) of a notification posts a notification with a given identifier.
 
 (2) Recievers listen(observe) to a notification for changes posted over time
*/


// Key Needed to identify Notification
let myNotificationKey = "com.example.notificationKey"

class Reciever2 {
    init() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: Notification.Name(myNotificationKey), object: nil)
    }
    
    @objc func handleNotification() {
        print("Got Message, I am Reciever 2!")
    }
}

class Reciever1 {
    
    init() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: Notification.Name(myNotificationKey), object: nil)
    }
    
    @objc func handleNotification() {
        print("Got Message!, I am Reciever 1")
    }
}

class Sender {
    
    init() {
        NotificationCenter
            .default
            .addObserver(self,
                         selector: #selector(sendMessage),
                         name: Notification.Name(rawValue: myNotificationKey),
                         object: nil
        )
    }
    
    @objc func sendMessage() {
        print("Send Message")
    }
    
    func notifyParties() {
        NotificationCenter.default.post(
            name: Notification.Name(rawValue: myNotificationKey),
            object: self
        )
    }
}


let re1 = Reciever1()
let re2 = Reciever2()
let sender = Sender()

sender.notifyParties()
