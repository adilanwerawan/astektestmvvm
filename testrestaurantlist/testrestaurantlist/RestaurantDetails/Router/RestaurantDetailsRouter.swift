//
//  RestaurantDetailsRouter.swift
//  RestaurantList
//
//  Created by MacBook on 14/03/2022.
//

import Foundation
import UIKit

class RestaurantDetailsRouter: Router {
    
   var viewModel: RestaurantDetailsViewModel
    
   init(viewModel: RestaurantDetailsViewModel) {
      self.viewModel = viewModel
   }
    
   func route(
      to routeID: String,
      from context: UIViewController,
      parameters: Any?)
   {
      
   }
}
