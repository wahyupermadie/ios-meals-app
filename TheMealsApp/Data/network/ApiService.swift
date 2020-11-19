//
//  ApiService.swift
//  TheMealsApp
//
//  Created by Wahyu Permadi on 19/11/20.
//

import Foundation

protocol Endpoint {

  var url: String { get }

}

enum Endpoints {
  
  enum Gets: Endpoint {
    case categories
    case meals
    case meal
    case search
    
    public var url: String {
      switch self {
      case .categories: return "\(BaseUrl)categories.php"
      case .meals: return "\(BaseUrl)filter.php?c="
      case .meal: return "\(BaseUrl)lookup.php?i="
      case .search: return "\(BaseUrl)search.php?s="
      }
    }
  }
  
}
