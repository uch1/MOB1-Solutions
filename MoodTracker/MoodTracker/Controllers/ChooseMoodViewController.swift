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
    func addFriendsMood(friend: Friend)
    func editFriendsMood(friend: Friend, row: Int)
}

class ChooseMoodViewController: UIViewController, RowDelegate {
    // MARK: PROPERTIES
    @IBOutlet weak var addNameTextField: UITextField!
    @IBOutlet weak var emojiSelector: UISegmentedControl!
    
    var friend: Friend?
    var row: Int?
    
    // MARK: DELEGATE
    weak var delegate: ShowMoodDelegate?
    
    // MARK: METHODS
    func pickAMood() {
        switch self.friend!.mood {
        case "😁":
            emojiSelector.selectedSegmentIndex = 0
        case "😑":
            emojiSelector.selectedSegmentIndex = 1
        case "😡":
            emojiSelector.selectedSegmentIndex = 2
        default:
            break
            //return
        }
    }
    
    // Conforms to RowDelegate protocol
    func sendRow(friend: Friend, row: Int) {
        self.friend = friend
        self.row = row
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Once the emoji is selected, run pickAMood function
        if self.friend != nil {
            pickAMood()
        }
    }
    
    // TODO: - review this code
    @IBAction func saveMood(_ sender: UIButton) {
        
        if self.friend == nil {
            guard let friendsName = addNameTextField.text, let friendsMood = emojiSelector.titleForSegment(at: emojiSelector.selectedSegmentIndex) else {return}
            
            let name = friendsName
            let mood = friendsMood
            
            let friend = Friend(name: name, mood: mood)
            
            //Delegation for adding a friend's mood
            delegate?.addFriendsMood(friend: friend)
            
        } else {
            guard let friendsName = addNameTextField.text, let friendsMood = emojiSelector.titleForSegment(at: emojiSelector.selectedSegmentIndex) else {return}
            
            self.friend?.name = friendsName
            self.friend?.mood = friendsMood
            
            // Delegation for editing a friend's mood
            delegate?.editFriendsMood(friend: self.friend!, row: self.row!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

