//
//  RecipeCell.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    static var identifier: String {
        return String(describing: self)
    }
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(dataSource: RecipeModel) {
        self.recipeName.text = dataSource.title
        
    }

}
