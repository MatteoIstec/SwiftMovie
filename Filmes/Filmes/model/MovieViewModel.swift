//
//  MovieViewModel.swift
//  test
//
//  Created by User on 28/06/2023.
//

import Foundation

//cards
@MainActor
class  MovieViewModel: ObservableObject {
    
    @Published var trending: [Movie] = []
    @Published var searchResults: [Movie] = []

    static let apiKey = "0b1561f293929f3157241d98e00fa1fe" //apikey
    
    func loadTrending() {    //trending page
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(MovieViewModel.apiKey)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let TrendingResults = try JSONDecoder().decode(TrendingResults.self, from: data) //decodes json into trending results
                trending = TrendingResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func search(term: String) {    //search page
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(MovieViewModel.apiKey)&language=en-US&page=1&include_adult=false&query=\(term)".addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!)!   //allow user to use spacebars
            
        
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let TrendingResults = try JSONDecoder().decode(TrendingResults.self, from: data) //decodes json into search results
                searchResults = TrendingResults.results
            } catch {
                print(error.localizedDescription)
        }
        
        }
    }
}
