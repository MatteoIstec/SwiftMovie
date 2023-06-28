//
//  ContentView.swift
//  test
//
//  Created by Matteo Leonforte on 15/06/2023.
// api key 0b1561f293929f3157241d98e00fa1fe
// api read access token eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYjE1NjFmMjkzOTI5ZjMxNTcyNDFkOThlMDBmYTFmZSIsInN1YiI6IjY0NmUyZGE5OTY2MWZjMDExZDk1OWRkNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4L0LBkOz_z1KevQQDoPhCdJPXjYHmVmtJiu2eP1IjgU
// application url https://www.themoviedb.org/3/movie/550?api_key=0b1561f293929f3157241d98e00fa1fe
//https://www.themoviedb.org/3/trending/movie/day?api_key=0b1561f293929f3157241d98e00fa1fe


import SwiftUI

struct ContentView: View {
    //viewmodel
    @StateObject var viewModel = MovieViewModel()
    @State var searchText = ""
    
    var body: some View {   //
        NavigationStack {
            ScrollView {
                if searchText.isEmpty {   //if searchtext is returned empty show on preview no results
                    if viewModel.trending.isEmpty {  //or else show hstack or make a lazyvstack
                        Text("No Results")
                    } else {
                        HStack {
                            Text("Home Page")
                                .font(.title)
                                .foregroundColor(.black)
                                .fontWeight(.heavy)
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.trending) { trendingItem in TrendingCard(trendingItem: trendingItem)
                                    
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                } else {
                    LazyVStack() { //arranges its elements in a line that grows vertically for the search bar
                        ForEach(viewModel.searchResults) { item in
                            HStack {
                                AsyncImage(url: item.backdropURL) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width:80, height: 120)
                                    
                                } placeholder: {
                                    ProgressView()
                                        .frame(width:80, height:120)
                                }
                                .clipped()
                                .cornerRadius(10)
                                
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .foregroundColor(.black)
                                        .font(.headline)
                                    HStack {
                                        Image(systemName:"hand.thumbsup.fill") //thumbs up %
                                        Text(String(format: "%.1f",item.vote_average))
                                        Spacer()
                                    }
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                }
                                Spacer()
                            }
                            .padding()
                            
                            .cornerRadius(20)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .background(Color(red:255/255,green:255/255,blue:255/240).ignoresSafeArea())
        }
        .searchable(text: $searchText)   //if a movie is typed load the page
        .onChange(of: searchText) { newValue in
            if newValue.count > 2 {
                viewModel.search(term: newValue)
                viewModel.loadTrending()
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
            
        }
    }
}
    
    
