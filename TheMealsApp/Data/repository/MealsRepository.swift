//
//  MealsRepository.swift
//  TheMealsApp
//
//  Created by Wahyu Permadi on 20/11/20.
//

import Foundation
import Alamofire
import RxSwift

protocol MealsRepository {
    func getMealsCategory() -> Single<[CategoryResponse]>
}

class MealsRepositoryImpl : MealsRepository {
    func getMealsCategory() -> Single<[CategoryResponse]> {
        return Single<[CategoryResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.categories.url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: CategoriesResponse.self) { response in
                        switch response.result {
                        case .success(let data):
                            observer(.success(data.categories))
                        case .failure(let error):
                            observer(.error(error))
                        }
                    }
            }
            return Disposables.create()
        }
    }
}
