//
//  DisplayMoodTableViewController.swift
//  MoodTracker
//
//  Created by Uchenna  Aguocha on 10/3/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class DisplayMoodTableViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "displayMoodTableViewCell", for: indexPath) as! DisplayMoodTableViewCell
        cell.nameTextField.text = "Uchenna"
        cell.emojiLabel.text = "😁"
        return cell 
    }
    
    // view ChooseMoodViewController by tapping on the + button or cell
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "chooseMoodSegue" {
                print("Table view cell tapped")
            } else if identifier == "addMoodSegue" {
                print("+ button tapped")
            }
        }
    }
    
}
