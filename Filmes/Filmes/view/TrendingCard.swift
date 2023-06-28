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
                    .resizable()
                    .scaledToFill()
                    .frame(width: 340, height: 240)
            } placeholder: {
                Rectangle().fill(Color(red:65/255,green:65/255,blue:65/255))
                    .frame(width:340, height: 240)
                
            }
            
            
            VStack {        //formatting, with the icons needed
                HStack {
                    Text(trendingItem.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)

                
                }
                .padding(.trailing)
                HStack {
                    Image(systemName:"hand.thumbsup.fill")
                    Text(String(format: "%.1f",trendingItem.vote_average)) //limits the % shown to 0.0
                    Spacer()
                }
                .foregroundColor(.white)
                .fontWeight(.heavy)
            }
            .padding()
            .background(Color(red:100/255,green:100/255,blue:100/255))
        }
        .cornerRadius(10)
    }
    
    
}
