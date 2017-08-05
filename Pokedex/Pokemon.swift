//
//  Pokemon.swift
//  Pokedex
//
//  Created by Mahmoud A on 8/1/17.
//  Copyright © 2017 Mahmoud. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _pocedex: String!
    private var _weight: String!
    private var _baseAttack: String!
    private var _nextevo: String!
    
    var name : String {
        return _name
    }
    
    var pokeId : Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
    
    var type: String{
        return _type
    }
    
    var defense: String {
        return _defense
    }
    
    var height: String {
        return _height
    }
    
    var pocedex: String {
        return _pocedex
    }
    
    var weight: String {
        return _weight
    }
    
    var baseAttack: String {
        return _baseAttack
    }
    
    var nextEvo: String {
        return _nextevo
    }


}
