//
//  ViewController.swift
//  TouchableDelegation
//
//  Created by Eliel A. Gordon on 10/5/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TouchDelegate {

    @IBOutlet weak var touchableView: TouchbleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        touchableView.touchDelegate = self
    }
    
    func didTouch() {
        print("Tap")
    }
    
    
}

