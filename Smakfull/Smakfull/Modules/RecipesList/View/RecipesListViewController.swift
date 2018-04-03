//
//  RecipesListViewController.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import UIKit
import RxSwift

class RecipesListViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = RecipesListViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shouldReloadTableView()
        self.dummyRequest()
    }

    private func shouldReloadTableView() {
        self.viewModel.reloadAction.subscribe(onNext: { [weak self] in
            self?.tableView.reloadData()
        }).disposed(by: self.disposeBag)
    }
    
    private func dummyRequest() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.viewModel.searchRequest(for: "appelsin")
        }
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
}
