//
//  ViewController.swift
//  RecipeApp_NextLevel
//
//  Created by tesco on 27/11/19.
//  Copyright © 2019 tesco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? RecipeCategoryViewController, segue.identifier == "welcomeToCategories"{
            let categoryListPresenter = RecipeCategoryViewPresenter()
            categoryListPresenter.updateDataCategory(dataCategory: AppDelegate.getDataFromFoodRecipeJSON(filename: "RecipeType"))
            vc.categoryPresenter = categoryListPresenter
        }
    }
    
}

