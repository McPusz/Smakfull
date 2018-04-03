//
//  InitialViewController.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import UIKit

//This is a dummy VC because of initial assignment misunderstanding
class InitialViewController: UIViewController {

    @IBOutlet weak var loaderImageView: UIImageView!
    @IBOutlet weak var loaderErrorLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    //This retry button was meant to retry request after network errors while geting recipes list, but the actual assignment's task is about live-requesting and searching by queryString in request than filtering results as I thought first (what I personally think is not such optimal...)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.goToRecipesList()
        }
    }
    
    private func setupView() {
        self.retryButton.isHidden = true
    }

    private func goToRecipesList() {
        let recipesSB = UIStoryboard(name: "RecipesList", bundle: nil)
        let recipesVC = recipesSB.instantiateViewController(withIdentifier: "RecipesListViewController")
        self.present(recipesVC, animated: true, completion: nil)
    }
}
