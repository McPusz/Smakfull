//
//  RecipesListViewModel.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import Foundation
import RxSwift

class RecipesListViewModel {
    
    private var recipes = [RecipeModel]()
    private let disposeBag = DisposeBag()
    
    var reloadAction: PublishSubject<Void> = PublishSubject<Void>()
    
    var numberOfRows: Int {
        return recipes.count
    }
    
    func dataSource(for row: Int) -> RecipeModel {
        return self.recipes[row]
    }
    
    func searchRequest(for query: String) {
        RecipesManager
            .shared
            .getRecipes(for: query).subscribe(onNext: { [weak self] (recipes) in
                self?.recipes = recipes
                self?.reloadAction.onNext(())
            }, onError: { (error) in
                print(error.localizedDescription)
            }).disposed(by: self.disposeBag)
    }
}