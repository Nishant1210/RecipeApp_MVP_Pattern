//
//  RecipeDescriptionViewPresenter.swift
//  RecipeApp_NextLevel
//
//  Created by tesco on 04/12/19.
//  Copyright © 2019 tesco. All rights reserved.
//

import Foundation

protocol RecipeDescriptionViewPresenterProtocol: class {
    func getNumberOfRows() -> Int
    func getIngredientList(indexPath : Int) -> String
    func getPreparationTimeDescription() -> String
    func getRecipeDescription() -> String
    func getTitleName() -> String
    func getRecipeLink() -> String
    func getIngredientsList() -> [IngredientsRequiredList]?
    func updateIngredientToRecipeList()
}

class RecipeDescriptionViewPresenter: RecipeDescriptionViewPresenterProtocol {
    var deliciousrecipe : RecipeDescriptionModal?
    var ingredientToRecipeList: IngredientsRequired?
    
    func getNumberOfRows() -> Int {
        return deliciousrecipe?.ingredients.count ?? 0
    }
    
    func getIngredientList(indexPath : Int) -> String {
        return deliciousrecipe?.ingredients[indexPath] ?? ""
    }
    
    func getRecipeDescription() -> String {
        return deliciousrecipe?.description ?? "No description available"
    }
    
    func getPreparationTimeDescription() -> String {
        return deliciousrecipe?.preparationTime ?? "No preparation time available"
    }
    
    func getTitleName() -> String {
        return deliciousrecipe?.title ?? "No title available"
    }
    
    func getRecipeLink() -> String {
        return deliciousrecipe?.recipeLink ?? "No URL available"
    }
    
    func getIngredientsList() -> [IngredientsRequiredList]? {
        return ingredientToRecipeList?.ingredients
    }
    
    func updateIngredientToRecipeList() {
        ingredientToRecipeList = AppDelegate.getDataFromIngredientRecipeMappingJsonJSON(filename: "IngredientRecipeMapping")
    }
}
