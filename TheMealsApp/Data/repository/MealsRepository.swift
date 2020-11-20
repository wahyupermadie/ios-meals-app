//
//  MealsRepository.swift
//  TheMealsApp
//
//  Created by Wahyu Permadi on 20/11/20.
//

import Foundation
import Alamofire

typealias MealsResultCompletion = (Result<[CategoryResponse], Error>) -> Void

protocol MealsRepository {
    func getMealsCategory(completion: @escaping MealsResultCompletion)
}

class MealsRepositoryImpl : MealsRepository {
    func getMealsCategory(completion: @escaping (Result<[CategoryResponse], Error>) -> Void) {
        guard let url = URL(string: Endpoints.Gets.categories.url) else { return }
        
        AF.request(url)
            .validate()
            .responseDecodable(of: CategoriesResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.categories))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
