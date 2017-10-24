//
//  ChooseCartoonTableViewController.swift
//  Cartoony
//
//  Created by Uchenna  Aguocha on 10/22/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//
import Foundation
import UIKit

protocol CartoonDelegate: class {
    func selectCartoon(cartoon: Cartoon)
}

class ChooseCartoonTableViewController: UITableViewController {
    
    weak var cartoonDelegate: CartoonDelegate?
    var selectedCartoon: Cartoon?
    
    var cartoons: [Cartoon] = []
    var name = "Cartoon"
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cartoons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartoonCell", for: indexPath)
        cell.textLabel?.text = cartoons[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCartoon = cartoons[indexPath.row]
        
        cartoonDelegate?.selectCartoon(cartoon: selectedCartoon)
        
        self.navigationController?.popViewController(animated: true)
    }

}
