//
//  RecipeCell.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import UIKit
import Kingfisher

class RecipeCell: UITableViewCell {

    static var identifier: String {
        return String(describing: self)
    }
    
    @IBOutlet private weak var recipeImageView: UIImageView!
    @IBOutlet private weak var recipeName: UILabel!
    
    func configure(dataSource: RecipeModel) {
        self.recipeName.text = dataSource.title
        self.recipeImageView.kf.setImage(with: dataSource.imageURL)
    }

}
