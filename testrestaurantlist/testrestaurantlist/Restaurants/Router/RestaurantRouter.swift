//
//  RestaurantRouter.swift
//  RestaurantList
//
//  Created by MacBook on 14/03/2022.
//

import Foundation
import UIKit

class RestaurantRouter: Router {
    
   unowned var viewModel: RestaurantsListViewModel
    
   init(viewModel: RestaurantsListViewModel) {
      self.viewModel = viewModel
   }
    
   func route(
      to routeID: String,
      from context: UIViewController,
      parameters: Any?)
   {
      guard let route = RestaurantListVC.Route(rawValue: routeID) else {
         return
      }
      switch route {
     
      case .restaurantDetails:
         // Push sign-up-screen:
        let vc = RestaurantDetailsVC()
        if let vm = parameters as? RestaurantCellViewModel{
            let vm = RestaurantDetailsViewModel(descriptionField: vm.descriptionField, distance: vm.distance, hasOffer: vm.hasOffer, hours: vm.hours, id: vm.id, image: vm.image, name: vm.name, offer: vm.offer, rating: vm.rating)
            vc.viewModel = vm
            vc.router = RestaurantDetailsRouter(viewModel: vm)
        }
        context.navigationController?.pushViewController(vc, animated: true)
      }
   }
}
