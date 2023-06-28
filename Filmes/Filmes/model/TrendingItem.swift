//
//  Movie.swift
//  test
//
//  Created by User on 28/06/2023.
//

import Foundation

struct Movie: Identifiable, Decodable {  //film option choosen
    
    let adult: Bool
    let id: Int
    let poster_path: String?
    let title: String
    let vote_average: Float
    let backdrop_path: String?
    
    var backdropURL: URL? {     //imagem preview film
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w300")
        return baseURL?.appending(path: backdrop_path ?? "")
    }
    var posterThumbnail: URL? { //image preview film but search bar
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w100")
        return baseURL?.appending(path: poster_path ?? "")
    }
}


