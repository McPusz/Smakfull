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
    
    var query: PublishSubject<String> = PublishSubject<String>()
    
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
    
    func recipeDetailsObservable(for row: Int) -> Observable<RecipeDetailsModel> {
        let recipeId = self.recipes[row].id
        return RecipesManager.shared.getRecipeDetails(for: String(recipeId))
    }
    
    init() {
        self.query.subscribe(onNext: { [weak self] (query) in
            self?.searchRequest(for: query)
        }).disposed(by: self.disposeBag)
    }
}
