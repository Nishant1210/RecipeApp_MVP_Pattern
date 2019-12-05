//
//  RecipeListViewPresenter.swift
//  RecipeApp_NextLevel
//
//  Created by tesco on 04/12/19.
//  Copyright © 2019 tesco. All rights reserved.
//

import Foundation

protocol RecipeListViewPresenterProtocol: class {
    func viewDidLoad() 
    func numberOfRowsInListBasedOnRecipes() -> Int
    func getIngredientsFromRecipeDescriptionJSON() -> RecipesListDescription?
    func getRecipeListName(indexPath: Int) -> String
    func searchRecipeId(recipeID: String) -> RecipeDescriptionModal?
    func getRecipeId(indexPath: Int) -> String
    func getIngredientName() -> String?
    func getRecipeList() -> [RecipeCategoryModal]?
    func updateIngredientsRequiredList(ingredientsRequiredList: IngredientsRequiredList?)
    func updateRecipeList(recipeList: [RecipeCategoryModal]?) 
}

class RecipeListViewPresenter: RecipeListViewPresenterProtocol {

    var recipeList: [RecipeCategoryModal]?
    var recipeDescriptionList: RecipesListDescription?
    var ingredientsRequiredList: IngredientsRequiredList?
    

    func updateIngredientsRequiredList(ingredientsRequiredList: IngredientsRequiredList?) {
        self.ingredientsRequiredList = ingredientsRequiredList
    }
    
    func viewDidLoad() {
        recipeDescriptionList = AppDelegate.getIngredientsFromRecipeDescriptionJSON(filename: "RecipeDescription")
    }
    
    func numberOfRowsInListBasedOnRecipes() -> Int {
        return recipeList?.count ?? 0
    }
    
    func getIngredientsFromRecipeDescriptionJSON() -> RecipesListDescription? {
        var recipesListDescription: RecipesListDescription?
        if let url = Bundle.main.url(forResource: "RecipeDescription", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                recipesListDescription = try JSONDecoder().decode(RecipesListDescription.self, from:data)
            } catch {
                print("Error!! Unable to parse the file")
            }
        }
        return recipesListDescription
    }
    
    func getRecipeListName(indexPath: Int) -> String {
        return recipeList?[indexPath].recipeName ?? ""
    }

    func getRecipeId(indexPath: Int) -> String {
        return recipeList?[indexPath].id ?? "0001"
    }
    
    func searchRecipeId(recipeID: String) -> RecipeDescriptionModal? {
        if let recipes = recipeDescriptionList?.Recipes, let indexValue = recipes.firstIndex(where: {$0.id == recipeID}) {
            return recipes[indexValue]
        }
        return nil
    }
    
    func getIngredientName() -> String? {
        return ingredientsRequiredList?.ingredientName
    }
    
    func getRecipeList() -> [RecipeCategoryModal]? {
        return ingredientsRequiredList?.recipeList
    }
    
    func updateRecipeList(recipeList: [RecipeCategoryModal]?) {
        self.recipeList = recipeList
    }
}
