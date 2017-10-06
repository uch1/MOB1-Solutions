//
//  ChooseMoodViewController.swift
//  MoodTracker
//
//  Created by Uchenna  Aguocha on 10/3/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

// TODO:- Add a delegate to pass info from ChooseMoodVC to DisplayMoodTableVC
protocol ShowMoodDelegate: class {
    func didSelectMood(mood: String)
}

class ChooseMoodViewController: UIViewController, ShowMoodDelegate {

    @IBOutlet weak var addNameTextField: UITextField!
    @IBOutlet weak var emojiSelector: UISegmentedControl!
    
    weak var moodDelegate: ShowMoodDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveMood(_ sender: UIButton) {
        if let friendsName = addNameTextField?.text {
            var emoji = ""
            
            switch emojiSelector.selectedSegmentIndex {
            case 0:
                emoji = "😁"
            case 1:
                emoji = "😑"
            case 2:
                emoji = "😡"
            default:
                break
            }
        }
        
        moodDelegate?.didSelectMood(mood: )
    }
    
}

