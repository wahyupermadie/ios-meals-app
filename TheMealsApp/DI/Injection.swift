//
//  Injection.swift
//  TheMealsApp
//
//  Created by Wahyu Permadi on 20/11/20.
//

import Foundation

final class Injection: NSObject {
    
    private func provideMealsRepository() -> MealsRepository {
        let repository : MealsRepository = MealsRepositoryImpl()
        return repository
    }
    
    func provideViewModel() -> HomeViewModelImpl {
        let repository = self.provideMealsRepository()
        let viewModel = HomeViewModelImpl(mealsRepository: repository)
        return viewModel
    }
}
