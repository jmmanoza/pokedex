//
//  Pokemon.swift
//  Pokedex
//
//  Created by Hallee Berry Manoza on 3/12/24.
//

import Foundation

struct Pokemon: Codable, Identifiable, Hashable {
    let id: String
    var pokemonName: String
    var pokemonImg: String
}
