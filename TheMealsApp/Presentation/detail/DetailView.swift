//
//  DetailView.swift
//  TheMealsApp
//
//  Created by Wahyu Permadi on 20/11/20.
//

import SwiftUI

struct DetailView: View {
    var category: CategoryResponse
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let meal = CategoryResponse(
              id: "1",
              title: "Beef",
              image: "https://www.themealdb.com/images/category/beef.png",
              description: "Beef is the culinary name for meat from cattle, particularly skeletal muscle."
        )
        DetailView(category: meal)
    }
}
