//
//  RestaurantCellViewModel.swift
//  RestaurantList
//
//  Created by MacBook on 14/03/2022.
//

import Foundation

protocol RestaurantCellViewModelProtocol {
    func getImageURL() -> URL?
    func getDictance() -> String
}

struct RestaurantCellViewModel:RestaurantCellViewModelProtocol {
    
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
    
    func getDictance() -> String{
        return String("\(Double(distance).rounded(toPlaces: 2) ) km")
    }
}
