//
//  RecipeCategoryViewPresenter.swift
//  RecipeApp_NextLevel
//
//  Created by tesco on 04/12/19.
//  Copyright © 2019 tesco. All rights reserved.
//

import Foundation

protocol RecipeCategoryViewPresenterProtocol: class {
    func getTheNumberOfRows() -> Int?
    func getImageNameForCell(indexPath : Int) -> String
    func getCategoryList(indexPath : Int) -> [RecipeCategoryModal]?
    func getCategoryCount() -> Int
    func updateDataCategory(dataCategory: DataCategory?)
}

class RecipeCategoryViewPresenter: RecipeCategoryViewPresenterProtocol {
    var dataCategory: DataCategory?
    
    func getTheNumberOfRows() -> Int? {
        return dataCategory?.categories.count ?? 0
    }
    
    func getImageNameForCell(indexPath : Int) -> String {
        return dataCategory?.categories[indexPath].categoryName ?? "No Image Found"
    }
    
    func getCategoryList(indexPath : Int) -> [RecipeCategoryModal]? {
        return dataCategory?.categories[indexPath].categoryList
    }
    
    func getCategoryCount() -> Int {
        return dataCategory?.categories.count ?? 1
    }
    
    func updateDataCategory(dataCategory: DataCategory?) {
        self.dataCategory = dataCategory
    }
}
