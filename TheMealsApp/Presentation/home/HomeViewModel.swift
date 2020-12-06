//
//  HomeViewModel.swift
//  TheMealsApp
//
//  Created by Wahyu Permadi on 20/11/20.
//

import Foundation
import RxSwift

protocol HomeViewModel {
    func fetchMealsCategories()
}

class HomeViewModelImpl : HomeViewModel, ObservableObject {
    var mealsRepository: MealsRepository
    @Published var isLoading: Bool = false
    @Published var categoriesResult: [CategoryResponse] = []
    @Published var error : String = ""
    
    init(mealsRepository: MealsRepository) {
        self.mealsRepository = mealsRepository
    }
    
    func fetchMealsCategories() {
        self.isLoading = true
        mealsRepository.getMealsCategory()
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { result in
                self.categoriesResult = result
                self.isLoading = false
            },onError: { error in
                self.error = error.localizedDescription
                self.isLoading = false
            })
    }
}
