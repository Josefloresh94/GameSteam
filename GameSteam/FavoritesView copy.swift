//
//  Favoritos.swift
//  GameSteam
//
//  Created by José Flores on 19/10/21.
//

import SwiftUI

struct FavoritesView: View {
    
    @ObservedObject var todosLosVideojuegos = ViewModel()
    var body: some View {
        ZStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
