//
//  Pokemon.swift
//  Pokedex
//
//  Created by Hallee Berry Manoza on 3/12/24.
//

import Foundation

struct PokemonResponse: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable, Hashable {
    let name: String
    let url: String
}

