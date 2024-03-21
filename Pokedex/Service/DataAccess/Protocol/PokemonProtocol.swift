//
//  PokemonProtocol.swift
//  Pokedex
//
//  Created by jmmanoza on 3/21/24.
//

import Foundation

protocol PokemonProtocol {
    func fetchListOfPokemons() async throws -> [Pokemon]
    //func fetchPokemonDetails() async throws -> Pokemon
}
