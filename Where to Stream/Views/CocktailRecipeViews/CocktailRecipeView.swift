//
//  CocktailDetailsView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/23/24.
//

import SwiftUI

struct CocktailRecipeView: View {
    let cocktailRecipe: CocktailRecipe
    
    var body: some View {
        VStack{
            Text(cocktailRecipe.drinkName)
            Text(cocktailRecipe.ingredients)
            Text(cocktailRecipe.method)
        }
    }
}

struct CocktailRecipeView_Preview: PreviewProvider {
    static var cocktail = CocktailRecipe(id: UUID(), source: 1, drinkName: "Sexy Marg", ingredients: "Tequilla, Triple sec, lime, and some extra sexy", method: "Ice, shake, strain, and serve")
    
    static var previews: some View {
        CocktailRecipeView(cocktailRecipe: cocktail)
    }
}
