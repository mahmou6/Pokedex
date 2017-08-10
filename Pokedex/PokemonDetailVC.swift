//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Mahmoud A on 8/4/17.
//  Copyright © 2017 Mahmoud. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var DescriptionLbl: UILabel!
    @IBOutlet weak var TypeLbl: UILabel!
    @IBOutlet weak var DefenseLbl: UILabel!
    @IBOutlet weak var HeightLbl: UILabel!
    @IBOutlet weak var PokedexLbl: UIStackView!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var EvoLbl: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name
        
       pokemon.downloadPokemonDetail {
        print("Did arrive here!")
        
        self.updateUI()
        }
    }
    
    func updateUI() {
        baseAttackLbl.text = pokemon.baseAttack
        print(baseAttackLbl.text as Any)
        DefenseLbl.text = pokemon.defense
        HeightLbl.text = pokemon.heigh
        weightLbl.text = pokemon.weight
        
    }

    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

   

}
