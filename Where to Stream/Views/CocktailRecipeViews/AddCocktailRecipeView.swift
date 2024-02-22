//
//  AddCocktailRecipeView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/22/24.
//

import SwiftUI

struct AddCocktailRecipeView: View {
    let viewModel = CocktailsViewModel()
    @State private var selectedSource: Int = 0
    @State private var drinkName: String = ""
    @State private var ingredients: String = ""
    @State private var method: String = ""
    
    var body: some View {
        ScrollView{
            VStack{
                HStack {
                    Spacer()
                    Button("Save") {
                        viewModel.saveRecipe(recipe: CocktailRecipe(id: UUID(), source: selectedSource, drinkName: drinkName, ingredients: ingredients, method: method))
                    }
                }
                .padding()
                HStack {
                    Text("Add Drink Recipe")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding()
                }
                Spacer()
                Section {
                    VStack {
                        HStack{
                            Text("Source")
                                .font(.caption)
                            Spacer()
                        } .padding(.horizontal)
                        
                        Picker(selection: $selectedSource, label: Text("Source")) {
                            Text("Original").tag(0)
                            Text("Website").tag(1)
                            Text("Menu").tag(2)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding()
                }
                Spacer()
                Section {
                    VStack{
                        HStack{
                            Text("Drink Name")
                                .font(.caption)
                            Spacer()
                        } .padding(.horizontal)
                        TextField("Drink Name", text: $drinkName)
                            .padding(.horizontal)
                    }
                }
                Spacer()
                Section {
                    VStack{
                        HStack{
                            Text("Ingredients")
                                .font(.caption)
                            Spacer()
                        } .padding(.horizontal)
                        TextEditor(text: $ingredients)
                            .border(Color.gray, width: 1)
                            .frame(height: 200)
                            .padding(.horizontal)
                    }
                }
                Spacer()
                Section {
                    VStack{
                        HStack{
                            Text("How to Make")
                                .font(.caption)
                            Spacer()
                        } .padding(.horizontal)
                        TextEditor(text: $method)
                            .border(Color.gray, width: 1)
                            .frame(height: 200)
                            .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct AddCocktailRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddCocktailRecipeView()
    }
}
