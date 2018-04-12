//
//  RecipesListViewController.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RecipesListViewController: UIViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel = RecipesListViewModel()
    private let disposeBag = DisposeBag()
    private let searchDebounceInterval: RxTimeInterval = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shouldReloadTableView()
        self.setupSearchBar()
        self.hideKeyboardWhenTappedAround()
        self.setupTransparentNaviBar()
        self.subscribeToDetailsShowEvent()
    }
    
    private func setupSearchBar() {
        
        let searchResultsObservable = self.searchBar
            .rx
            .text
            .orEmpty
            .filter{!$0.isEmpty}
            .debounce(self.searchDebounceInterval, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
        
        searchResultsObservable.bind(to: self.viewModel.query).disposed(by: self.disposeBag)
    }
    
    private func subscribeToDetailsShowEvent() {
        self.viewModel.showDetails.subscribe(onNext: { (details) in
            self.showRecipeDetails(dataSource: details)
        }).disposed(by: self.disposeBag)
    }
    
    private func shouldReloadTableView() {
        self.viewModel
            .reloadAction
            .subscribe(onNext: { [weak self] in
                self?.tableView.reloadData()
            }).disposed(by: self.disposeBag)
    }
    
//    private func selectRecipe(at row: Int) {
//        self.viewModel.recipeDetailsObservable(for: row)
//            .subscribe(onNext: { [weak self] (details) in
//                self?.showRecipeDetails(dataSource: details)
//            }).disposed(by: self.disposeBag)
//    }
    
    private func showRecipeDetails(dataSource: RecipeDetailsModel) {
        let recipeDetailsSB = UIStoryboard(name: "RecipeDetailsStoryboard", bundle: nil)
        guard let recipeDetailsVC = recipeDetailsSB.instantiateViewController(withIdentifier: "RecipeDetailsViewController") as? RecipeDetailsViewController else { return }
        recipeDetailsVC.injectDataSource(dataSource: dataSource)
        self.navigationController?.pushViewController(recipeDetailsVC, animated: true)
    }
}

//MARK: TableView protocols
extension RecipesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as? RecipeCell
        cell?.configure(dataSource: self.viewModel.dataSource(for: indexPath.row))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.selectRecipe(at: indexPath.row)
        self.viewModel.rowOfTappedCell.onNext(indexPath.row)
    }
}
