//
//  Router.swift
//  RestaurantList
//
//  Created by MacBook on 14/03/2022.
//

import Foundation
import UIKit

protocol Router {
   func route(
      to routeID: String,
      from context: UIViewController,
      parameters: Any?
   )
}
