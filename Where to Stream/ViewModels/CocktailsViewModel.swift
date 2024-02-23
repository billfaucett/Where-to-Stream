//
//  CocktailsViewModel.swift
//  Where to Stream
//
//  Created by William Faucett on 2/22/24.
//

import Foundation

class CocktailsViewModel: ObservableObject {
    @Published var cocktailRecipes: CocktailRecipes?
    @Published var cocktailRecipe: CocktailRecipe?
    
    func saveRecipe(recipe: CocktailRecipe) {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(recipe)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                if let fileURL = Bundle.main.url(forResource: "CocktailRecipes", withExtension: "json") {
                    try jsonString.write(to: fileURL, atomically: true, encoding: .utf8)
                    print("Cocktail recipe saved to: \(fileURL)")
                    
                } else {
                    print("Error: CocktailRecipies.json file not found in main bundle")
                }
            }
        } catch {
            print("Error saving cocktail recipe: \(error)")
        }
    }

    func getRecipies() {
        if let url = Bundle.main.url(forResource: "cocktailrecipies", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let recipes = try JSONDecoder().decode(CocktailRecipes.self, from: data)
                    cocktailRecipes = recipes
                } catch {
                    print("Error loading recipes from JSON: \(error)")
                }
            } else {
                print("JSON file not found in bundle.")
            }
    }
}
