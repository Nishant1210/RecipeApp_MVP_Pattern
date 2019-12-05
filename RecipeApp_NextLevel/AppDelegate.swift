//
//  AppDelegate.swift
//  RecipeApp_NextLevel
//
//  Created by tesco on 27/11/19.
//  Copyright © 2019 tesco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    static func getDataFromFoodRecipeJSON(filename fileName: String) -> DataCategory? {
        var category: DataCategory?
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                category = try JSONDecoder().decode(DataCategory.self, from:data)
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        return category
    }
    
    static func getIngredientsFromRecipeDescriptionJSON(filename fileName: String) -> RecipesListDescription? {
        var recipesListDescription: RecipesListDescription?
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                recipesListDescription = try JSONDecoder().decode(RecipesListDescription.self, from:data)
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        return recipesListDescription
    }
    
    static func getDataFromIngredientRecipeMappingJsonJSON(filename fileName: String) -> IngredientsRequired? {
        var ingredientsRequired: IngredientsRequired?
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                ingredientsRequired = try JSONDecoder().decode(IngredientsRequired.self, from:data)
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        return ingredientsRequired
    }
}

