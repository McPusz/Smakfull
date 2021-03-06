//
//  RecipeDetailsViewModel.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import Foundation

class RecipeDetailsViewModel {
    
    var dataSource: RecipeDetailsModel!
    
    var likesString: String {
        return String(dataSource.numberOfLikes)
    }
    
    var recipeName: String {
        return dataSource.title
    }
    
    var recipeDesc: String {
        return dataSource.description
    }
    
    var htmlDesc: NSAttributedString? {
        guard let htmlData = NSString(string: dataSource.description).data(using: String.Encoding.unicode.rawValue)
            else { return nil }
        let htmlAttribute = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
        let attrStr = try? NSAttributedString(data: htmlData, options: htmlAttribute, documentAttributes: nil)
        return attrStr
    }
    
    var webLink: String {
        return NetworkSettings.webLink + String(dataSource.id)
    }
    
    var imageURL: URL? {
        guard let urlString = dataSource.images.first?.url, let url = URL(string: urlString) else { return nil }
        return url
    }
}
