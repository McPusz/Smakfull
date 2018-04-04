//
//  MoyaResponse+Toast.swift
//  Smakfull
//
//  Created by Magdusz on 04.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import Foundation
import Moya
import MCToast

extension Moya.Response {
    
    func printToast() {
        if let request = self.request {
            
            var toastText = "Response Status Code: \(self.statusCode)"
            
            if let responseBody = try? JSONSerialization.jsonObject(with: self.data, options: []) {
                toastText += " \nResponse Body: \(responseBody)"
            }
            if let method = request.httpMethod {
                toastText += " \nRequest Method: \(method)"
            }
            if let url = request.url {
                toastText += " \nRequest URL: \(url)"
            }
            if let fields = request.allHTTPHeaderFields {
                toastText += " \nRequest HTTP Fields: \(fields)"
            }
            if let requestBodyData = request.httpBody, let requestBodyJson = try? JSONSerialization.jsonObject(with: requestBodyData, options: []) {
                toastText += " \nRequest Body: \(requestBodyJson)"
            }
            
            _ = MCToast(text: toastText)
            print(toastText)
            //quack
        }
    }
}
