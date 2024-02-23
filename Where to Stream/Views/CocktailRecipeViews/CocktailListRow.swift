//
//  CocktailListRow.swift
//  Where to Stream
//
//  Created by William Faucett on 2/23/24.
//

import SwiftUI

struct CocktailListRow: View {
    let cocktailRecipe: CocktailRecipe
    
    var body: some View {
        VStack {
            HStack {
                Text(cocktailRecipe.drinkName)
                Button("Show") {
                    //To do
                }
            }
        }
    }
}

struct CocktailListRow_Preview: PreviewProvider {
    static var recipe = CocktailRecipe(id: UUID(), source: 2, drinkName: "Test Drink", ingredients: "Ingredients", method: "method")
    
    static var previews: some View {
        CocktailListRow(cocktailRecipe: recipe)
    }
}
