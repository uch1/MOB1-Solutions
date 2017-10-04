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
        let cell = tableView.dequeueReusableCell(withIdentifier: "displayMoodTableViewCell", for: indexPath)
        cell.textLabel?.text = "OH"
        return cell 
    }
}
