//
//  DisplayMoodTableViewController.swift
//  MoodTracker
//
//  Created by Uchenna  Aguocha on 10/3/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

protocol RowDelegate: class {
    func sendRow(friend: Friend, row: Int)
}

class DisplayMoodTableViewController: UITableViewController, ShowMoodDelegate {
    // MARK: PROPERTIES
    @IBOutlet weak var displayMoodTableView: UITableView!
    
    var friendsList = [Friend]() {
        didSet {
            displayMoodTableView.reloadData()
        }
    }
    
    // MARK: DELEGATE
    weak var delegate: RowDelegate?
     
    
    // MARK: METHODS
    
    // Conformed to the ShowMoodDelegate
    func editFriendsMood(friend: Friend, row: Int) {
        self.friendsList[row].name = friend.name
        self.friendsList[row].mood = friend.mood
        displayMoodTableView.reloadData()
    }
    // Conformed to the ShowMoodDelegate
    func addFriendsMood(friend: Friend) {
        friendsList.append(friend)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "displayMoodTableViewCell", for: indexPath) as! DisplayMoodTableViewCell
        cell.nameTextField.text = friendsList[indexPath.row].name
        cell.emojiLabel.text = friendsList[indexPath.row].mood
        return cell 
    }
    
    // view ChooseMoodViewController by tapping on the + button or cell
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            
            if identifier == "chooseMoodSegue" {
                let chooseMoodViewController = segue.destination as! ChooseMoodViewController
                chooseMoodViewController.delegate = self
                
            } else if identifier == "addMoodSegue" {
                let chooseMoodViewController = segue.destination as! ChooseMoodViewController
                chooseMoodViewController.delegate = self
                self.delegate = chooseMoodViewController as RowDelegate
                
                let indexPath = displayMoodTableView.indexPathForSelectedRow?.row
                //self.delegate?.sendRow(friend: friendsList[(indexPath)!], row: (indexPath)!)
            }
        } else {return}
    }
}
