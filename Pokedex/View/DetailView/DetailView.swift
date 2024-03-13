//
//  DetailView.swift
//  Pokedex
//
//  Created by Hallee Berry Manoza on 3/13/24.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var isOpen: Bool
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                VStack {
                    HStack {
                        Button(action: {
                            isOpen.toggle()
                        }) {
                            Image("ic_close")
                                .resizable()
                                .frame(width: 40, height: 40)
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 120)
                    
                    VStack {
                        VStack {}
                        .frame(height: 90)
                        
                        pokemonTextStatsView
                        pokemonStatsView
                        evolutionView(evoImg1: "001", evoImg2: "001", width: proxy.size.width)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .frame(width: proxy.size.width - 32, height: proxy.size.height - 200)
                    .background(Color("SecondaryBg"))
                    .cornerRadius(16)
                    .overlay {
                        VStack {
                            Image("001")
                                .resizable()
                                .frame(width: 200, height: 200)
                            Spacer()
                        }
                        .padding(.top, -100)
                    }
                   
                    Spacer()
                }
            }
            
        }
        .background(Color("PrimaryColor"))
    }
}

private extension DetailView {
    @ViewBuilder
    var pokemonTextStatsView: some View {
        Group {
            Text("Bulbasur")
                .font(Font.custom("Proxima Condessed Regular", size: 25))
                .foregroundColor(Color("PrimaryColor"))
                .padding(.bottom)
            
            Text("If it is attacked by the enemy that is stronger than itself, it feigns injury to fool the enemy and escapes.")
                .font(Font.custom("Proxima Condessed Regular", size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(Color("SecondaryColor"))
                .padding(.bottom)
            
            Divider()
                .frame(minHeight: 2)
                .background(Color("PrimaryColor"))
                .padding(.bottom, 32)
        }
    }
    
    @ViewBuilder
    var pokemonStatsView: some View {
        HStack(spacing: 16) {
            configStatsView(title: "Type", value: "Fire")
            Spacer()
            configStatsView(title: "Attack", value: "99")
            Spacer()
            configStatsView(title: "Def", value: "40")
        }
        .padding(.horizontal)
        .padding(.bottom, 16)
        
        HStack(spacing: 16) {
            configStatsView(title: "Height", value: "6")
            Spacer()
            configStatsView(title: "Weight", value: "99")
            Spacer()
            configStatsView(title: "PId", value: "37")
        }
        .padding(.horizontal)
        .padding(.bottom, 32)
    }
    
    @ViewBuilder
    func configStatsView(title: String, value: String) -> some View {
        VStack {
            Text(value)
                .font(Font.custom("Proxima Black", size: 24))
                .foregroundColor(Color("SecondaryColor"))
                .padding(.bottom, -2)
            Text(title)
                .font(Font.custom("Proxima Condessed Regular", size: 16))
                .foregroundColor(Color("SecondaryColor"))
        }
    }
    
    @ViewBuilder
    func evolutionView(evoImg1: String, evoImg2: String, width: CGFloat) -> some View {

        VStack {
            Text("EVOLUTION")
                .font(Font.custom("Proxima Condessed Regular", size: 18))
                .foregroundColor(Color("SecondaryColor"))
            
            HStack {
                Image(evoImg1)
                    .resizable()
                    .frame(width: 100, height: 100)
                Spacer()
                Image(systemName: "arrow.right")
                    .foregroundColor(Color("PrimaryColor"))
                Spacer()
                Image(evoImg2)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            .padding(.horizontal)
        }
        .padding(.horizontal, 32)
        .frame(width: width)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(isOpen: .constant(true))
    }
}
