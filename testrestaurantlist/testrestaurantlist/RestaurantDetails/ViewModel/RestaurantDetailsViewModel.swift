//
//  RestaurantDetailsViewModel.swift
//  RestaurantList
//
//  Created by MacBook on 14/03/2022.
//

import Foundation
import UIKit


protocol RestaurantDetailsViewModelProtocol {
    func getImageURL() -> URL?
    func getRating() -> CGFloat
}

struct RestaurantDetailsViewModel:RestaurantDetailsViewModelProtocol {
    
    var descriptionField : String
    var distance : Float
    var hasOffer : Bool
    var hours : String
    var id : Int
    var image : String
    var name : String
    var offer : String
    var rating : Float
    
    func getImageURL() -> URL? {
        guard let url = URL(string: image) else {
            return nil
        }
        return url
    }
    
    func getRating() -> CGFloat{
        return CGFloat(rating)
    }
}
