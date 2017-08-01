//
//  Pokemon.swift
//  Pokedex
//
//  Created by Mahmoud A on 8/1/17.
//  Copyright © 2017 Mahmoud. All rights reserved.
//

import Foundation

class Pokemon {
    
    fileprivate var _name: String!
    fileprivate var _pokedexId: Int!
    
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
}
