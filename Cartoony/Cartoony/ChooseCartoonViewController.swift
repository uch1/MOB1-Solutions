//
//  ChooseCartoonViewController.swift
//  Cartoony
//
//  Created by Uchenna  Aguocha on 10/23/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

protocol CartoonDelegate: class {
    func selectCartoon(cartoon: Cartoon)
}

class ChooseCartoonViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    //MARK: Properties
    @IBOutlet weak var myTableView: UITableView!
    
    weak var cartoonDelegate: CartoonDelegate?
    var selectedCartoon: Cartoon?
    
    var cartoons: [Cartoon] = []
    var name = "Cartoon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cartoons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartoonCell", for: indexPath)
        cell.textLabel?.text = cartoons[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCartoon = cartoons[indexPath.row]
        
        cartoonDelegate?.selectCartoon(cartoon: selectedCartoon)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
