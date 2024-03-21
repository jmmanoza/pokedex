//
//  PokemonAPIDataService.swift
//  Pokedex
//
//  Created by jmmanoza on 3/21/24.
//

import Foundation

struct PokemonAPIDataService: PokemonProtocol {
    func fetchListOfPokemons() async throws -> [Pokemon] {
        let url = "https://pokeapi.co/api/v2/pokemon?limit=1500"
        guard let url = URL(string: url) else {
            throw ErrorCases.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
            response.statusCode == 200 else {
            throw ErrorCases.invalidResponse
        }
        
        do {
            let pokemonResponse = try JSONDecoder().decode(PokemonResponse.self, from: data)
            return pokemonResponse.results
        } catch {
            throw ErrorCases.invalidData
        }
    }
//    
//    func fetchPokemonDetails() async throws -> Pokemon {
//    }
}

enum ErrorCases: LocalizedError {
    case invalidUrl
    case invalidResponse
    case invalidData
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "Invalid url found."
        case .invalidResponse:
            return "Invalid response found."
        case .invalidData:
            return "Invalid data found."
        }
    }
}
