//
//  MainView.swift
//  Pokedex
//
//  Created by Hallee Berry Manoza on 3/11/24.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    
    let soundManager = SoundManager()
    @StateObject var viewModel = PokemonViewModel()
    var audioPlayer: AVAudioPlayer?
    @State var showPokemonDetails: Bool = false
    
    @State var inputText: String = ""
    private var gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { proxy in
                    VStack {
                        navBarView(width: proxy.size.width)
                        
                        SearchBarController(text: $inputText, placeholderText: "Search...")
                            .padding(.top, -60)
                        
                        ScrollView {
                            LazyVGrid(columns: gridItems) {
                                ForEach(Array(viewModel.pokemons.enumerated()), id: \.element) { pokemonIndex, pokemon in
                                    PokemonRowView(pokemonImg: "\(viewModel.pokemonImgUrl)\(pokemonIndex+1)\(viewModel.imgExt)",
                                                   pokemonName: pokemon.name.capitalized,
                                                   viewWidth: proxy.size.width / 3) {
                                        showPokemonDetails.toggle()
                                    }
                                }
                            }
                        }
                        .background(Color("PrimaryBg"))
                    }
                }
            }
            .task {
                await viewModel.getPokemons()
            }
            .edgesIgnoringSafeArea(.all)
            .fullScreenCover(isPresented: $showPokemonDetails) {
                DetailView(isOpen: $showPokemonDetails)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

private extension MainView {
    @ViewBuilder
    func navBarView(width: CGFloat) -> some View {
        HStack {
            Button(action: {}) {
                Image("pokemon")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            Spacer()
            Text("POKEMON INDEX")
                .font(Font.custom("Proxima Regular", size: 14))
                .foregroundColor(Color("SecondaryColor"))
            Spacer()
            
            Button {
                soundManager.playSound(soundName: "PoGo", type: "m4a")
            } label: {
                Image("piano")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .padding([.horizontal, .bottom], 16)
        .background(Color("PrimaryColor"))
        .frame(width: width, height: 150)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
