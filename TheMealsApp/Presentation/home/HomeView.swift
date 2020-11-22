//
//  HomeView.swift
//  TheMealsApp
//
//  Created by Wahyu Permadi on 20/11/20.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModelImpl
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    VStack {
                      Text("Loading...")
                      ActivityIndicator()
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(
                            self.viewModel.categoriesResult,
                            id: \.id
                        ) { category in
                            ZStack {
                                navigateToDetailPage(for: category) {
                                    CategoryRow(category: category)
                                }.buttonStyle(PlainButtonStyle())
                            }.padding(10)
                        }
                    }
                }
            }.onAppear(perform: {
                if self.viewModel.categoriesResult.isEmpty {
                    viewModel.fetchMealsCategories()
                }
            })
            .navigationBarTitle(
                Text("Meals Apps")
            )
        }
    }
}
