//
//  InitialViewController.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import UIKit
import RxSwift

class InitialViewController: UIViewController {

    @IBOutlet weak var loaderImageView: UIImageView!
    @IBOutlet weak var loaderErrorLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
     private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        let recipes = RecipesManager.shared.getRecipes(for: "appelsin")
        recipes.subscribe(onNext: { [weak self] (recipes) in
            print(recipes)
            self?.goToRecipesList(recipes: recipes)
        }).disposed(by: (self.disposeBag))
    }
    
    private func setupView() {
        self.retryButton.isHidden = true
    }

    private func goToRecipesList(recipes: [RecipeModel]) {
        let recipesSB = UIStoryboard(name: "RecipesList", bundle: nil)
        let recipesVC = recipesSB.instantiateViewController(withIdentifier: "RecipesListViewController") as? RecipesListViewController
        recipesVC?.recipes = recipes
        self.present(recipesVC!, animated: true, completion: nil)
    }
}
