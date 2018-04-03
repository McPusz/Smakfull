//
//  RecipeDetailsViewController.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import UIKit
import Kingfisher

class RecipeDetailsViewController: UIViewController {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeDescriptionTextView: UITextView!
    @IBOutlet weak var recipeLikesButton: UIButton!
    @IBOutlet weak var recipeWebViewButton: UIButton!
    
    let viewModel = RecipeDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }

    private func configure() {
        if let imageURL = self.viewModel.imageURL {
            self.recipeImageView.kf.setImage(with: imageURL)
        }
        self.recipeDescriptionTextView.text = self.viewModel.recipeDesc
        self.recipeLikesButton.setTitle(self.viewModel.likesString, for: .normal)
    }
    
}
