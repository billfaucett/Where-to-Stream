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
        let fileManager = FileManager.default
        
        guard let fileURL = Bundle.main.url(forResource: "CocktailRecipes", withExtension: "json") else {
            print("Error: CocktailRecipies.json file not found in main bundle")
            return
        }
        
        if fileManager.fileExists(atPath: fileURL.path) {
            do {
                let jsonEncoder = JSONEncoder()
                let jsonData = try jsonEncoder.encode(recipe)

                guard let jsonString = String(data: jsonData, encoding: .utf8) else {
                    print("Error: Unable to convert JSON data to string")
                    return
                }

                try jsonString.write(to: fileURL, atomically: true, encoding: .utf8)
                print("Cocktail recipe saved to: \(fileURL)")
            } catch {
                print("Error saving cocktail recipe: \(error)")
            }
        } else {
            print("Error: CocktailRecipies.json file does not exist")
        }
    }


    func getRecipies() {
        if let url = Bundle.main.url(forResource: "CocktailRecipes", withExtension: "json") {
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
