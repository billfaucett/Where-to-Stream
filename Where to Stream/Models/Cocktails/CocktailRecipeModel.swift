//
//  CocktailRecipeModel.swift
//  Where to Stream
//
//  Created by William Faucett on 2/22/24.
//

import Foundation

struct CocktailRecipes: Codable {
    let cocktails: [CocktailRecipe]
}

struct CocktailRecipe: Codable, Identifiable {
    let id: UUID
    let source: Int
    let drinkName: String
    let ingredients: String
    let method: String
}
