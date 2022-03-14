//
//  RestaurantsListService.swift
//  RestaurantList
//
//  Created by MacBook on 11/03/2022.
//

import Foundation

protocol RestaurantsListServiceProtocol {
    func getRestaurants(url:String,completion: @escaping (_ success: Bool, _ results: Restaurants?, _ error: String?) -> ())
}

class RestaurantsListService: RestaurantsListServiceProtocol {
    func getRestaurants(url:String,completion: @escaping (Bool, Restaurants?, String?) -> ()) {
        HttpRequestHelper().GET(url: url, params: ["": ""], httpHeader: .application_json) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(Restaurants.self, from: data!)
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse Restaurant to model")
                }
            } else {
                completion(false, nil, "Error: Restaurant GET Request failed")
            }
        }
    }
}
