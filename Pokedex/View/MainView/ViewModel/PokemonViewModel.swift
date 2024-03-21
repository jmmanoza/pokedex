//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Hallee Berry Manoza on 3/12/24.
//

import Foundation

class PokemonViewModel: ObservableObject {
    
    let service: PokemonAPIDataService
    let pokemonImgUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    let imgExt = ".png"
    @Published var pokemons = [Pokemon]()
    
    init(service: PokemonAPIDataService = PokemonAPIDataService()) {
        self.service = service
    }
    
    @MainActor
    func getPokemons() async {
        do {
            let pokemons = try await service.fetchListOfPokemons()
            self.pokemons = pokemons
        } catch(let error) {
            print("catch error; \(error.localizedDescription)")
        }
    }
}
