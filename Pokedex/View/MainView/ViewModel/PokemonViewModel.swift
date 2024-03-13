//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Hallee Berry Manoza on 3/12/24.
//

import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = [
        .init(id: "00001", pokemonName: "bulbasur", pokemonImg: "001"),
        .init(id: "00002", pokemonName: "bulbasur", pokemonImg: "001"),
        .init(id: "00003", pokemonName: "bulbasur", pokemonImg: "001"),
        .init(id: "00004", pokemonName: "bulbasur", pokemonImg: "001"),
        .init(id: "00005", pokemonName: "bulbasur", pokemonImg: "001"),
        .init(id: "00006", pokemonName: "bulbasur", pokemonImg: "001"),
    ]
}
