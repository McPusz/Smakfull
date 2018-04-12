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
    
    var showDetails = PublishSubject<RecipeDetailsModel>()
    var rowOfTappedCell = PublishSubject<Int>()
    
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
    
    private func subscribeToNewQuery() {
        self.query.subscribe(onNext: { [weak self] (query) in
            self?.searchRequest(for: query)
        }).disposed(by: self.disposeBag)
    }
    
    private func subscribeToCellTapped() {
        self.rowOfTappedCell
            .subscribe(onNext: { [weak self] (row) in
                self?.getDetailsForCellRow(row: row)
        }).disposed(by: self.disposeBag)
    }
    
    private func getDetailsForCellRow(row: Int) {
        //TODO: cancel request if new cell tap registered
        let recipeId = self.recipes[row].id
        RecipesManager.shared
            .getRecipeDetails(for: String(recipeId))
            .subscribe(onNext: { [weak self] (details) in
                self?.showDetails.onNext(details)
        }).disposed(by: self.disposeBag)
    }
    
    init() {
        self.subscribeToNewQuery()
        self.subscribeToCellTapped()
    }
    
}
