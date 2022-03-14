//
//  RestaurantsListViewModel.swift
//  RestaurantList
//
//  Created by MacBook on 14/03/2022.
//

import Foundation

class RestaurantsListViewModel: NSObject {
    private var restaurantService: RestaurantsListServiceProtocol
    
    var reloadView: (() -> Void)?
    
    private var restaurants = Restaurants()
    
    private var sortedByDistance = true
    
    var restaurantCellViewModels = [RestaurantCellViewModel]() {
        didSet {
            reloadView?()
        }
    }
    
    init(restaurantService: RestaurantsListServiceProtocol = RestaurantsListService()) {
        self.restaurantService = restaurantService
    }
    
    func getRestaurants() {
        restaurantService.getRestaurants(url: AppConfig.restaurantListURL) { success, model, error in
            if success, let restaurants = model {
                self.fetchData(restaurants: restaurants)
            } else {
                print(error!)
            }
        }
    }
    
    func fetchData(restaurants: Restaurants) {
        self.restaurants = restaurants // Cache
        var vms = [RestaurantCellViewModel]()
        for restaurant in restaurants {
            vms.append(createCellViewModel(restaurant: restaurant))
        }
        restaurantCellViewModels = vms
    }
    
    func createCellViewModel(restaurant: Restaurant) -> RestaurantCellViewModel {
        return RestaurantCellViewModel(descriptionField: restaurant.descriptionField, distance: restaurant.distance, hasOffer: restaurant.hasOffer, hours: restaurant.hours, id: restaurant.id, image: restaurant.image, name: restaurant.name, offer: restaurant.offer ?? "", rating: restaurant.rating)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> RestaurantCellViewModel {
        return restaurantCellViewModels[indexPath.row]
    }
    
    func sortRestaurantsByDistance(){
        let sortByDistance = !sortedByDistance
        if sortByDistance{
            self.restaurants.sort { (Double($0.distance) ) > (Double($1.distance) ) }
        } else {
            self.restaurants.sort { (Double($0.distance) ) < (Double($1.distance) ) }
        }
        var vms = [RestaurantCellViewModel]()
        for restaurant in restaurants {
            vms.append(createCellViewModel(restaurant: restaurant))
        }
        restaurantCellViewModels = vms
        sortedByDistance = sortByDistance
    }
}
