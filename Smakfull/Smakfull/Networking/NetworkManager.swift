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
    
    var provider: MoyaProvider<T> = MoyaProvider<T>()
    
    func request(_ target: T) -> Observable<Moya.Response> {
        return self.provider
            .rx
            .request(target)
            .asObservable()
    }
}

class RecipesManager: NetworkManager<NetworkService> {
    static let shared = RecipesManager()
    
    func getRecipes(for query: String) -> Observable<[RecipeModel]> {
        let response = self.request(.getRecipes(forQuery: query))
        return response.map(RecipeResults.self).flatMap { (results) -> Observable<[RecipeModel]> in
            return Observable.just(results.results)
        }
    }

}
