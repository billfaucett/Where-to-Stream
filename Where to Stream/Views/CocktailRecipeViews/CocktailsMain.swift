//
//  CocktailsMain.swift
//  Where to Stream
//
//  Created by William Faucett on 2/22/24.
//

import SwiftUI

struct CocktailsMain: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddCocktailRecipeView()){
                    Text("Add a New Cocktail")
                        .padding()
                        .background(Color.mint)
                        .foregroundColor(.indigo)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    CocktailsMain()
}
