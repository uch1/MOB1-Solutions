//
//  PokemonDisplayViewController.swift


/*
Instructions:

- Use delegation to pass the selected(guessed) Pokemon from the ChoosePokemonViewController to the PokemenDisplayViewController
- Run the checkGuessedPokemonAndShowPokemon() function in the delegate in PokemonDisplayViewController - this viewcontroller

 Notes:
 
 Pokemons - list of all pokemons
 selectedPokemon - the currently guessed/selected pokemon from the ChoosePokemonViewController, this will be empty at launch
 displayedPokemon - you don't need to touch this, is just shows a random pokemon to be guessed
 
*/

import UIKit



class PokemonDisplayViewController: UIViewController, PokemonDelegate {

    @IBOutlet weak var guessedPokemon: UILabel!
    @IBOutlet weak var pokeDisplayImageVIew: UIImageView!
    
    static let pokemons = [
        Pokemon(name: "Charmander", shadowImage: UIImage(named: "char_shadow")!, actualImage: UIImage(named: "char")!),
        Pokemon(name: "Psyduck", shadowImage: UIImage(named: "psy_shadow")!, actualImage: UIImage(named: "psy")!),
        Pokemon(name: "Horsea", shadowImage: UIImage(named: "seadra_shadow")!, actualImage: UIImage(named: "seadra")!),
        Pokemon(name: "Dragonaire", shadowImage: UIImage(named: "dragonaire_shadow")!, actualImage: UIImage(named: "dragonaire")!)
    ]
    
    var selectedPokemon: Pokemon?
    var displayedPokemon: Pokemon = randomPoke()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokeDisplayImageVIew.image = displayedPokemon.shadowImage
       
    }
    
    // TODO: Run this function when you setup your delegate
    // Run this right when and where you receive the guessed pokemon
    // What this does: Selects a randwom pokemon - starts the guessing game
    
    static func randomPoke() -> Pokemon {
        let index = Int(arc4random()) % pokemons.count
        return pokemons[index]
    }
    
    func goToChoosePokemonViewController() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let choosePokemonController = storyboard.instantiateViewController(withIdentifier: "ChoosePokemonViewController") as! ChoosePokemonTableViewController
        
        choosePokemonController.pokemons = PokemonDisplayViewController.pokemons
        
        // TODO: Make sure to set the delegation on the ChoosePokemonViewController
        choosePokemonController.pokemonDelegate = self
        
    self.navigationController?.pushViewController(choosePokemonController, animated: true)
   
    }
    
    
    /*
         Checks if the selected pokemon from the delegate matches the displayed pokemon
         - Run this when your delegate method is called
    */
    func didSelectPokemon(pokemon: Pokemon) {
        self.selectedPokemon = pokemon
        checkGuessedPokemonAndShowPokemon()
    }
    
    func checkGuessedPokemonAndShowPokemon() {
        guard let selectedPokemon = selectedPokemon else {return}
        if selectedPokemon == displayedPokemon {
            guessedPokemon.text = "You guessed right!"
        } else {
            guessedPokemon.text = "Your guess was wrong"
        }
        
        pokeDisplayImageVIew.image = displayedPokemon.actualImage
        
        displayedPokemon = PokemonDisplayViewController.randomPoke()
    }
    
    @IBAction func choosePokemon(_ sender: UIButton) {
        
        goToChoosePokemonViewController()
    }
}
