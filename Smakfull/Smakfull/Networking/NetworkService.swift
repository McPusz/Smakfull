//
//  NetworkService.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import Foundation
import Moya

enum NetworkService {
    case getRecipes(forQuery: String)
    case getRecipeDetails(id: String)
}

extension NetworkService: TargetType {
    var baseURL: URL { return NetworkSettings.baseURL }
    
    var path: String {
        switch self {
        case .getRecipes(_):
            return "/search/recipes"
        case .getRecipeDetails(let id):
            return "/recipes/\(id)"
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var method: Moya.Method { return .get }
    
    var sampleData: Data { return Data() }
    
    var task: Task {
        
        switch self {
        case .getRecipes(let query):
            var params = [String: Any]()
            params["limit"] = 50
            params["query"] = query
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        default: return .requestPlain
            
        }
        
       }
    
    var headers: [String: String]? { return nil }
}
