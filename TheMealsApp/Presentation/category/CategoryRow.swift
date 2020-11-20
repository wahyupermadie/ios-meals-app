//
//  CategoryRow.swift
//  TheMealsApp
//
//  Created by Wahyu Permadi on 19/11/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryRow: View {
    var category: CategoryResponse
    init(category: CategoryResponse) {
        self.category = category
    }
    
    var body: some View {
        VStack {
            categoryImg
            content
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 250)
        .background(Color.random.opacity(0.3))
        .cornerRadius(30)
    }
}

extension CategoryRow {
    var categoryImg: some View {
        WebImage(url: URL(string: category.image))
            .resizable()
            .indicator(.activity)
            .scaledToFit()
            .frame(width: 200)
            .cornerRadius(30)
            .padding(.top)
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 10){
          Text(category.title)
            .font(.title)
            .bold()
                  
          Text(category.description)
            .font(.system(size: 14))
            .lineLimit(2)
        }.padding(
            EdgeInsets(
                top: 0, leading: 16, bottom: 16, trailing: 16
            )
        )
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        let meal = CategoryResponse(
              id: "1",
              title: "Beef",
              image: "https://www.themealdb.com/images/category/beef.png",
              description: "Beef is the culinary name for meat from cattle, particularly skeletal muscle."
        )
        CategoryRow(category: meal)
    }
}
