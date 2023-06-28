//
//  TrendingResults.swift
//  test
//
//  Created by User on 28/06/2023.
//

import Foundation  //Trending page 

struct TrendingResults: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
