//
//  File.swift
//  myProject1
//
//  Created by beaunexMacBook on 3/7/24.
//

import Foundation
import RxSwift

// 뷰로부터 독립적이며 뷰가 필요한 데이터 및 메서드를 포함하고 있는 모델임.
// 하나의 뷰에는 하나의 뷰모델이 있음 1:1관계
// 추후 뷰의 모양이 바뀌거나, 모델이 바뀐다고 했을 때 뷰모델이 어댑터 역할을 함.
// 뷰와 모델사이의 의존성을 낮추기 때문에 커다란 디자인이 필요할 때 필요로함.

final class RootViewModel {
    // 제목값, 셀들을 구성하는 메서드가 필요함.
    let title = "GRAPE NEWS"
    // 실제로 서버통신하는 코드를 만들게아니라, 단순히 테스팅용으로 할때 목업데이터들을 활용할 수 있으니.
    // 프로토콜로 바라보도록하면 재사용성이 증가함.
    // 의존성 주입. 현업에서 자주쓰이는 디자인 패턴
    
    private let articleService: ArticleServiceProtocol
    
    init(articleService: ArticleServiceProtocol) {
        self.articleService = articleService
    }
    
    func fetchArticles() -> Observable<[ArticleViewModel]> {
        articleService.fetchNews().map { $0.map { ArticleViewModel(article: $0) }
        }
    }
}
