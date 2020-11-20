//
//  HomeViewModel.swift
//  TheMealsApp
//
//  Created by Wahyu Permadi on 20/11/20.
//

import Foundation

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
        mealsRepository.getMealsCategory{ [weak self] (result) in
            guard let self = self else { return }
            
            var data: [CategoryResponse] = []
            var error: String = ""
            switch result {
            case .success(let res):
                data = res
            case .failure(let err):
                error = err.localizedDescription
            }
            DispatchQueue.main.async {
                self.isLoading = false
                self.error = error
                self.categoriesResult = data
            }
        }
    }
}
