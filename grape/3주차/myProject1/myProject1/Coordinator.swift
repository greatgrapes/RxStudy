//
//  Coordinator.swift
//  myProject1
//
//  Created by beaunexMacBook on 3/7/24.
//

import UIKit
// 이 함수가 하는 역할


class Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let rootViewController = RootViewController(viewModel: RootViewModel(articleService: ArticleService()))
        let navigationRootViewController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = navigationRootViewController
        // 화면 렌더링 시켜주는 함수
        window.makeKeyAndVisible()
    }
    
}
