//
//  GuessCartoonViewController.swift
//  Cartoony
//
//  Created by Uchenna  Aguocha on 10/22/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//
import Foundation
import UIKit

class GuessCartoonViewController: UIViewController, CartoonDelegate {
    
    // MARK: Properties
    @IBOutlet weak var guessCartoonLabel: UILabel!
    @IBOutlet weak var cartoonImageView: UIImageView!
    
    
    
    static let cartoons = [
        Cartoon(name: "Broly", shadowImage: #imageLiteral(resourceName: "broly_shadow"), actualImage: #imageLiteral(resourceName: "broly")),
        Cartoon(name: "Chukie", shadowImage: #imageLiteral(resourceName: "chuckie_shadow"), actualImage: #imageLiteral(resourceName: "chuckie")),
        Cartoon(name: "Courage", shadowImage: #imageLiteral(resourceName: "courage_shadow"), actualImage: #imageLiteral(resourceName: "courage")),
        Cartoon(name: "Frieza", shadowImage: #imageLiteral(resourceName: "frieza_shadow") , actualImage: #imageLiteral(resourceName: "frieza")),
        Cartoon(name: "Goku", shadowImage: #imageLiteral(resourceName: "goku_shadow") , actualImage: #imageLiteral(resourceName: "goku") ),
        Cartoon(name: "Johnny Bravo", shadowImage: #imageLiteral(resourceName: "johnnybravo_shadow") , actualImage: #imageLiteral(resourceName: "johnnybravo")),
        Cartoon(name: "Mickey Mouse", shadowImage: #imageLiteral(resourceName: "mickeymouse_shadow") , actualImage: #imageLiteral(resourceName: "mickeymouse")),
        Cartoon(name: "Patrick", shadowImage: #imageLiteral(resourceName: "patrick_shadow") , actualImage: #imageLiteral(resourceName: "patrick")),
        Cartoon(name: "Pearl", shadowImage: #imageLiteral(resourceName: "pearl_shadow"), actualImage: #imageLiteral(resourceName: "pearl")),
        Cartoon(name: "Squidward", shadowImage: #imageLiteral(resourceName: "squidward_shadow") , actualImage: #imageLiteral(resourceName: "squidward") ),
        Cartoon(name: "Timmy Turner", shadowImage: #imageLiteral(resourceName: "timmyturner_shadow") , actualImage: #imageLiteral(resourceName: "timmyturner")),
        Cartoon(name: "Winnie the Pooh", shadowImage: #imageLiteral(resourceName: "winniethepooh_shadow") , actualImage: #imageLiteral(resourceName: "winniethepooh"))
    ]
    
    var selectedCartoon: Cartoon?
    var displayedCartoon: Cartoon = randomCartoons()
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartoonImageView.image = displayedCartoon.shadowImage
    }
    
    static func randomCartoons() -> Cartoon {
        let index = Int(arc4random()) % cartoons.count
        return cartoons[index]
    }
    
    func goToChooseCartoonTableViewContoller() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let chooseCartoonController = storyboard.instantiateViewController(withIdentifier: "ChooseCartoonViewController") as! ChooseCartoonViewController
        
        chooseCartoonController.cartoons = GuessCartoonViewController.cartoons
        
        chooseCartoonController.cartoonDelegate = self
        
        self.navigationController?.pushViewController(chooseCartoonController, animated: true)
    }
    
    func selectCartoon(cartoon: Cartoon) {
        self.selectedCartoon = cartoon
        checkGuessedCartoon(selectedCartoon: selectedCartoon!)
    }
    
    func checkGuessedCartoon(selectedCartoon: Cartoon) {
        self.selectedCartoon = selectedCartoon
        
        if selectedCartoon == displayedCartoon {
            guessCartoonLabel.text = "Good Job! It's \(displayedCartoon.name)"
        } else {
            guessCartoonLabel.text = "Try again! It was \(displayedCartoon.name)"
        }
        
        cartoonImageView.image = displayedCartoon.actualImage
        displayedCartoon = GuessCartoonViewController.randomCartoons()
    }
    
    @IBAction func chooseCartoon(_ sender: UIButton) {
        self.goToChooseCartoonTableViewContoller()
    }
    
    @IBAction func tryAgain(_ sender: UIButton) {
        let randomCartoon = GuessCartoonViewController.randomCartoons()
        displayedCartoon = randomCartoon
        cartoonImageView.image = displayedCartoon.shadowImage
        guessCartoonLabel.text = "Guess that Cartoon!"
    }
    
}

//extension GuessCartoonViewController: CartoonDelegate {
//    func selectCartoon(cartoon: Cartoon) {
//        self.selectedCartoon = cartoon
//        checkGuessedCartoon(selectedCartoon: selectedCartoon!)
//    }
//}

