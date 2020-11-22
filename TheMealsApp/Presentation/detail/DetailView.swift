//
//  DetailView.swift
//  TheMealsApp
//
//  Created by Wahyu Permadi on 20/11/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    var category: CategoryResponse
    
    var body: some View {
        VStack(alignment: .leading) {
            WebImage(url: URL(string: self.category.image))
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 32)
                .scaledToFit()
                .background(Color.random.opacity(0.3))
                .cornerRadius(30)
            
            Text(self.category.title)
                .font(.title)
                .bold()
            
            Text(self.category.description)
                .padding(.top, 16)
            
            Spacer()
                
        }.padding([.leading, .trailing], 16)
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
