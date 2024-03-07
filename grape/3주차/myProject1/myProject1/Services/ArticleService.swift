//
//  ArticleService.swift
//  myProject1
//
//  Created by beaunexMacBook on 3/7/24.
//

import Foundation
import Alamofire
import RxSwift

protocol ArticleServiceProtocol {
    func fetchNews() -> Observable<[Article]>
}

class ArticleService: ArticleServiceProtocol {
    // escaping 안쓰고 RxSwift로 구현
    // 콜백함수를 받지 않고도, 데이터를 fetching함.
    
    func fetchNews() -> Observable<[Article]> {
        return Observable.create { observer in
            let urlString = "https://newsapi이용 url작성~~~"
            
            guard let url = URL(string: urlString) else {
                observer.onError(NSError(domain: "URLCreationError", code: -1, userInfo: nil))
                return Disposables.create()
            }
            
            let request = AF.request(url)
                .responseDecodable(of: ArticleResponse.self) { response in
                    switch response.result {
                    case .success(let articleResponse):
                        observer.onNext(articleResponse.articles)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    // Alamofire 사용 시
//    private func fetchNews(completion: @escaping((Error?, [Article]?) -> Void)) {
//        let urlString =
//        
//        guard let url = URL(string: urlString) else { return completion(NSError(domain: "js", code: 404, userInfo: nil), nil)}
//        
//        
//        // response는 error, ArticleResponse를 가지고있음.
//        let request = AF.request(url, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseDecodable(of: ArticleResponse.self) { response in
//            if let error = response.error {
//                return completion(error, nil)
//            }
//            
//            if let articles = response.value?.articles {
//                return completion(nil, articles)
//            }
//        }
//        
//    }
    
}
