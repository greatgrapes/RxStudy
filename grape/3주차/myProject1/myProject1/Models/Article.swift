//
//  File.swift
//  myProject1
//
//  Created by beaunexMacBook on 3/7/24.
//

import Foundation

struct ArticleResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    // 어떤값이 존재하고 어떤값이 존재하지 않는지 정확히 모르기때문에 옵셔널로 선언.
    // JSON형식의 데이터를 Swift구조체로 변환을 도와주는 Protocol :: Codable
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String? 
}
