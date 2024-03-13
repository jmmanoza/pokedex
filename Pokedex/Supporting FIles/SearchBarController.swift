//
//  SearchBarController.swift
//  Pokedex
//
//  Created by Hallee Berry Manoza on 3/11/24.
//

import Foundation
import SwiftUI
import UIKit

struct SearchBarController: UIViewRepresentable {
    
    @Binding var text: String
    var placeholderText: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        
        let searchBar = UISearchBar(frame: .zero)
        searchBar.backgroundColor = UIColor(Color("PrimaryBg"))
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholderText
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> SearchBarController.Coordinator {
        return Coordinator(text: $text)
    }
}
