//
//  Pokemon.swift
//  Pokedex
//
//  Created by Mahmoud A on 8/1/17.
//  Copyright © 2017 Mahmoud. All rights reserved.
//

import Foundation
import Alamofire

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
    private var _nextEvotxt: String!
    private var _nextEvoName: String!
    private var _nextEvoID: String!
    private var _nextEvoLvl: String!
    private var _pokemonURL: String!
    
    var nextEvoLvl : String {
        if _nextEvoLvl == nil {
            _nextEvoLvl = ""
        }
        return _nextEvoLvl
    }
    
    var nextEvoID : String {
        if _nextEvoID == nil {
            _nextEvoID = ""
        }
        return _nextEvoID
    }
    
    var nextEvoName: String {
        if _nextEvoName == nil {
            _nextEvoName = ""
        }
        return _nextEvoName
    }
    
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var nextEvotxt: String {
        if _nextEvotxt == nil {
            _nextEvotxt = ""
        }
        
        return _nextEvotxt
    }
    
    var baseAttack: String {
        if _baseAttack == nil {
            _baseAttack = ""
        }
        
        return _baseAttack
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var heigh: String {
        if _height == nil{
            _height = ""
        }
        return _height
    }
    
    var defense: String{
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var name : String {
        return _name
    }
    
    var pokedexId : Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func downloadPokemonDetail(completed: @escaping DowloadComplete){
        
        Alamofire.request(_pokemonURL).responseJSON { (response) in

            if let dict = response.result.value as? Dictionary<String, Any> {
                
                if let weight = dict["weight"] as? String{
                    self._weight = weight
                }

                if let height = dict["height"] as? String{
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._baseAttack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                print(self._weight)
                print(self._height)
                print(self._baseAttack)
                print(self._defense)
                
                if let types = dict["types"] as? [Dictionary<String,String>] , types.count > 0 {
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                    }
                    
                    if types.count > 1 {
                        for x in 1..<types.count {
                            if let name = types[x]["name"] {
                                self._type! += "\(name.capitalized)"
                            }
                        }
                    }
                    
                    print(self.type)
                    
                } else  {
                    self._type = ""
                }
                
                if let descArr = dict["descriptions"] as? [Dictionary<String,String>] , descArr.count > 0 {
                    
                    if let url = descArr[0]["resource_uri"] {
                        
                        print(url)
                        
                        let descURL = "\(URL_BASE)\(url)"
                        
                        Alamofire.request(descURL).responseJSON(completionHandler: { (response) in
                            
                            if let descDict = response.result.value as? Dictionary<String,Any> {
                                
                                if let description = descDict["description"] as? String {
                                    
                                    let newDescription = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    
                                    self._description = newDescription
                                    
                                    print(newDescription)
                                }
                                
                            }
                            completed()
                        })
                    
                    }
                } else {
                    self._description = ""
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String,Any>] , evolutions.count > 0 {
                    
                    if let nextEvo = evolutions[0]["to"] as? String {
                        
                        if nextEvo.range(of: "mega") == nil {
                            self._nextEvoName = nextEvo
                            
                if let ID = evolutions[0]["resource_uri"] as? String {
                      let newID = ID.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                        let newestID = newID.replacingOccurrences(of: "/", with: "")
                                    
                        self._nextEvoID = newestID
                        
                    if let levelExist = evolutions[0]["level"] {
                        
                        if let lvl = levelExist as? Int {
                            self._nextEvoLvl = "\(lvl)"
                        }
                        
                    } else {
                        self._nextEvoLvl = ""
                    }
                            
                        }
                

                    }
                }
                print(self.nextEvoLvl)
                print(self.nextEvoID)
                print(self.nextEvoName)
            }
            }
            completed()
                

    }
        
    }
    
}



