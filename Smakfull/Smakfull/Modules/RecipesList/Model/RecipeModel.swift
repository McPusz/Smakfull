//
//  RecipeModel.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import Foundation

struct RecipeResults: Codable {
    let results: [RecipeModel]
}

struct RecipeModel: Codable {
    
    let title: String
    let id: Int
    let image: String
    //TODO: There could be a lovely property 'details' that could contain info like description, but assignment's instruction was to get recipes details from different API path
    var imageURL: URL {
        return URL(string: image)!
    }
    

}
