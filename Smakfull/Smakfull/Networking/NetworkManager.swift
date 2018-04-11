//
//  NetworkManager.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class NetworkManager<T: TargetType> {
    
    fileprivate var provider: MoyaProvider<T> = MoyaProvider<T>()
    
    fileprivate func request(_ target: T) -> Observable<Moya.Response> {
        return self.provider
            .rx
            .request(target)
            .asObservable()
            .do(onNext: { (response) in
                if !((200..<300) ~= response.statusCode) {
                    response.printToast()
                }
            })
    }
}

class RecipesManager: NetworkManager<NetworkService> {
    static let shared = RecipesManager()
    
    func getRecipes(for query: String) -> Observable<[RecipeModel]> {
        let response = self.request(.getRecipes(forQuery: query))
        return response.map(RecipeResults.self).map{$0.results}
    }
    
    func getRecipeDetails(for id: String) -> Observable<RecipeDetailsModel> {
        let response = self.request(.getRecipeDetails(id: id))
        return response.map(RecipeDetailsModel.self)
    }

}
