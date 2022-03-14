//
//  Restaurant.swift
//  RestaurantList
//
//  Created by MacBook on 11/03/2022.
//

import Foundation

typealias Restaurants = [Restaurant]

struct Restaurant : Codable {
    
    let descriptionField : String
    let distance : Float
    let hasOffer : Bool
    let hours : String
    let id : Int
    let image : String
    let name : String
    let offer : String?
    let rating : Float
    
    enum CodingKeys: String, CodingKey {
        case descriptionField = "description"
        case distance = "distance"
        case hasOffer = "hasOffer"
        case hours = "hours"
        case id = "id"
        case image = "image"
        case name = "name"
        case offer = "offer"
        case rating = "rating"
    }
}
