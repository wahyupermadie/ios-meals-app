//
//  TheMealsAppApp.swift
//  TheMealsApp
//
//  Created by Wahyu Permadi on 19/11/20.
//

import SwiftUI

@main
struct TheMealsAppApp: App {
    let homeViewModel = Injection.init().provideViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: homeViewModel)
        }
    }
}
