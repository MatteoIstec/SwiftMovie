//
//  TrendingCard.swift
//  test
//
//  Created by User on 28/06/2023.
//

import Foundation
import SwiftUI

struct TrendingCard: View {
    
    let trendingItem: Movie
    
    var body: some View {   //card of the trending movies
        ZStack(alignment: .bottom) {
            AsyncImage(url: trendingItem.backdropURL) { image in image
                   image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 340, height: 200)
            } placeholder: {
                    Rectangle().fill(Color(red:0/255,green:0/255,blue:0/255))
                        .frame(width:340, height: 200)
 
                }
                
                
            }
            
            VStack {        //formatting, with the icons needed
                HStack {
                    Text(trendingItem.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                HStack {
                    Image(systemName:"hand.thumbsup.fill")
                    Text(String(format: "%.1f",trendingItem.vote_average)) //limits the % shown to 0.0
                    Spacer()
                }
                .foregroundColor(.white)
                .fontWeight(.heavy)
            }
                .padding()
                .background(Color(red:61/255,green:61/255,blue:88/255))
            }
        }
  
