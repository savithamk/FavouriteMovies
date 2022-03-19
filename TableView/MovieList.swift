//
//  MovieList.swift
//  TableView
//
//  Created by Savitha M K on 2022-03-18.
//

import Foundation

class MovieList {
    
    //setting initial list of movies
    init(autofil: Bool){
        if autofil {
            movies = ["Eternals","Dune","No Time To Die","Last Night in Soho","Ron's Done Wrong","Halloween Kills","Venom","Antlers","The Addams Family 2"]
        }
    }

    //add movie to movie list
    func addMovie(movie: Movie){
        movies.append(movie.title)
        
    }
    
    //add movie from movie list
    func removeMovie(indexPath: IndexPath){
        movies.remove(at: indexPath.row)
    }
    
    //reorder movies in the section
    func moveMovie(fromIndexPath: IndexPath, toIndexPath: IndexPath){
        let temp = movies[fromIndexPath.row]
        movies.remove(at: fromIndexPath.row)
        movies.insert(temp, at: toIndexPath.row)
    }
}
