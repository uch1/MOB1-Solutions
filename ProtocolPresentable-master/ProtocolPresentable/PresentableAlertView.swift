//
//  PresentableAlertView.swift
//  ProtocolPresentable
//
//  Created by Eliel A. Gordon on 10/3/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import Foundation
import UIKit

// TODO:
// Write protocol  to present alert view on any UIViewController
// Hint: You will need to constrain the protocol to UIViewController instances and use protocol extensions

protocol AlertPresentable {
    func presentAlert()
}

extension AlertPresentable where Self: UIViewController {
    func presentAlert(title: String) {
        let alertVC = UIAlertController(
            title: "Some Tittle",
            message: "Some message",
            preferredStyle: .alert
        )
        // 2. Adding action to alertView
        alertVC.addAction(
            UIAlertAction(
                title: "Ok",
                style: .default,
                handler: { (action) in
        
            })
        )
        self.present(alertVC, animated: true, completion: nil)
    }
}

// Boilerplate for UIAlertController
// 1. Alert ViewController

//let alertVC = UIAlertController(
//    title: "Some Tittle",
//    message: "Some message",
//    preferredStyle: .alert
//)

//// 2. Adding Action to alertview
//alertVC.addAction(
//    UIAlertAction(
//        title: "Ok",
//        style: .default,
//        handler: { (action) in
//
//    })
//)


// 2. TODO: Present Alert View

