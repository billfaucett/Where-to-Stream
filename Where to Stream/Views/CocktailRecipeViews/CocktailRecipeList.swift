//
//  CocktailRecipeList.swift
//  Where to Stream
//
//  Created by William Faucett on 2/23/24.
//

import SwiftUI

struct CocktailRecipeList: View {
    @State var isLoading = false
    @State var recipes: CocktailRecipes?
    let viewModel = CocktailsViewModel()
    
    var body: some View {
        VStack {
            Section{
                if let cocktails = recipes?.cocktails {
                    VStack {
                        ForEach(cocktails) { cocktail in
                            CocktailListRow(cocktailRecipe: cocktail)
                        }
                    }
                }
            }
        }
        .onAppear {
            isLoading = true
            viewModel.getRecipies()
        }
        .onReceive(viewModel.$cocktailRecipes) { recipesRec in
            recipes = recipesRec
        }
    }
}

#Preview {
    CocktailRecipeList()
}
