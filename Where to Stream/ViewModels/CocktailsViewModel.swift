//
//  CocktailsViewModel.swift
//  Where to Stream
//
//  Created by William Faucett on 2/22/24.
//

import Foundation

class CocktailsViewModel: ObservableObject {
    @Published var cocktailRecipe: CocktailRecipe?
    
    func saveRecipe(recipe: CocktailRecipe) {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(recipe)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                if let fileURL = Bundle.main.url(forResource: "CocktailRecipies", withExtension: "json") {
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
}
