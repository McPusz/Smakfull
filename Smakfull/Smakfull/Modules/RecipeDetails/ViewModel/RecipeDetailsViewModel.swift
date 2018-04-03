//
//  RecipeDetailsViewModel.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import Foundation

class RecipeDetailsViewModel {
    
    var dataSource: RecipeDetailsModel? = nil
    
    var likesString: String {
        guard let dataSource = dataSource else { return "0" }
        return String(dataSource.numberOfLikes)
    }
    
    var recipeDesc: String {
        guard let dataSource = dataSource else { return "" }
        return dataSource.description
    }
    
    var webLink: String {
        guard let dataSource = dataSource else { return "0" }
        return NetworkSettings.webLink + String(dataSource.id)
    }
    
    var imageURL: URL? {
        guard let dataSource = dataSource, let urlString = dataSource.images.first?.url, let url = URL(string: urlString) else { return nil }
        return url
    }
}
