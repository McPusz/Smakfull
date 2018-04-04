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
        self.setupTransparentNaviBar(withTitle: self.viewModel.recipeName)
    }

    private func configure() {
        if let imageURL = self.viewModel.imageURL, let attrStr = self.viewModel.htmlDesc {
            self.recipeImageView.kf.setImage(with: imageURL)
            self.recipeDescriptionTextView.attributedText = attrStr
        }
        self.recipeLikesButton.setTitle(self.viewModel.likesString, for: .normal)
    }
    
    @IBAction func openWebView(_ sender: UIButton) {
        guard let url = URL(string: self.viewModel.webLink) else { return }
        let webViewSB = UIStoryboard(name: "WebViewStoryboard", bundle: nil)
        guard let webViewVC = webViewSB.instantiateInitialViewController() as? WebViewViewController else { return }
        webViewVC.url = url
        self.present(webViewVC, animated: true, completion: nil)
    
    }
    
}
