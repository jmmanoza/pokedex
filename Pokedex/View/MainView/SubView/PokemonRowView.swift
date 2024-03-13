//
//  PokemonRowView.swift
//  Pokedex
//
//  Created by Hallee Berry Manoza on 3/12/24.
//

import SwiftUI

struct PokemonRowView: View {
    
    private var pokemonImg: String
    private var pokemonName: String
    private var viewWidth: CGFloat
    private var callback: (()->Void)
    
    init(pokemonImg: String, pokemonName: String, viewWidth: CGFloat, callback: @escaping (()->Void)) {
        self.pokemonImg = pokemonImg
        self.pokemonName = pokemonName
        self.viewWidth = viewWidth
        self.callback = callback
    }
    
    var body: some View {
        VStack {
            Image(pokemonImg)
                .resizable()
                .frame(width: viewWidth - 20, height: viewWidth - 20)
            
            Rectangle()
                .cornerRadius(10)
                .frame(width: 100, height: 25)
                .foregroundColor(Color("BannerColor"))
                .overlay {
                    Text(pokemonName)
                        .font(Font.custom("Proxima Regular", size: 14))
                        .foregroundColor(Color("SecondaryColor"))
                }
        }
        .frame(width: viewWidth, height: viewWidth + 20)
        .onTapGesture {
            callback()
        }
    }
}

struct PokemonRowView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRowView(pokemonImg: "001", pokemonName: "Bulbasur", viewWidth: 100.0, callback: {})
    }
}
