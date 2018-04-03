//
//  InitialViewController.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var loaderImageView: UIImageView!
    @IBOutlet weak var loaderErrorLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0) { [weak self] in
            self?.goToRecipesList()
        }
    }
    
    private func setupView() {
        self.retryButton.isHidden = true
    }

    private func goToRecipesList() {
        let recipesSB = UIStoryboard(name: "RecipesList", bundle: nil)
        let recipesVC = recipesSB.instantiateViewController(withIdentifier: "RecipesListViewController")
//        guard let recipesVC = recipesSB.instantiateInitialViewController() else { return }
        self.present(recipesVC, animated: true, completion: nil)
    }
}
