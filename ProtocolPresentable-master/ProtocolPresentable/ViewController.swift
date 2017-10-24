//
//  ViewController.swift
//  ProtocolPresentable
//
//  Created by Eliel A. Gordon on 10/3/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AlertPresentable {

    @IBAction func presentView(_ sender: Any) {
        // TODO: Use your protocol function to present the alert view controller
        presentAlert(title: "Rick and Morty")
    }
    override func viewDidLoad() {
        super.viewDidLoad()        
        
    }
    
}

