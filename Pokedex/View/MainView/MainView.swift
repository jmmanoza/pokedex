//
//  MainView.swift
//  Pokedex
//
//  Created by Hallee Berry Manoza on 3/11/24.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    
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
                                ForEach(viewModel.pokemons, id: \.self) { pokemon in
                                    PokemonRowView(pokemonImg: pokemon.pokemonImg,
                                                   pokemonName: pokemon.pokemonName,
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
                playSound()
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
    
    func playSound() {
        print("tapped")
        guard let audioFile = Bundle.main.path(forResource: "PoGo", ofType: "m4a") else {
            return
        }
        do {
            let soundPlayer: AVAudioPlayer? = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioFile))
            guard let player = soundPlayer else { return }
            
            player.play()
            
        } catch let error {
            print("Cannot play sound. \(error.localizedDescription)")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
