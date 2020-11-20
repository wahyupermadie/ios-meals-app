//
//  Category.swift
//  TheMealsApp
//
//  Created by Wahyu Permadi on 19/11/20.
//

import Foundation

struct CategoriesResponse: Decodable {

  let categories: [CategoryResponse]
  
}

struct CategoryResponse: Decodable, Identifiable {

  private enum CodingKeys: String, CodingKey {
    case id = "idCategory"
    case title = "strCategory"
    case image = "strCategoryThumb"
    case description = "strCategoryDescription"
  }

  var id: String = ""
  var title: String = ""
  var image: String = ""
  var description: String = ""

}
