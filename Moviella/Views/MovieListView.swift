//
//  MovieListView.swift
//  Moviella
//
//  Created by MD RUBEL on 30/5/22.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject private var viewModel = MovieListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.movies, id: \.id) { movie in
                    MovieCell(movie: movie)
                }
                .navigationTitle("Movie List")
            }
            .onAppear { viewModel.getMovies() }
            
            if viewModel.isLoading { LoadingView() }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
