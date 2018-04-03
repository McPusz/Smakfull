//
//  RecipeDetailsModel.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import Foundation

struct RecipeDetailsModel: Codable {
    let id: Int
    let title: String
    let images: [RecipeDetailsImage]
    let numberOfLikes: Int
    let description: String
}

struct RecipeDetailsImage: Codable {
    let url: String
}
