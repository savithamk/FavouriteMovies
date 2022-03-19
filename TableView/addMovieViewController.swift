//
//  AddMovieViewController.swift
//  TableView
//
//  Created by Savitha M K on 2022-03-18.
//

import UIKit

class addMovieViewController: UIViewController {
    
    
    @IBOutlet weak var newMovieLabel: UITextField!
    
    var movieList: MovieList!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //Code block to add a new movie
        if !newMovieLabel.text!.isEmpty{
            let title = newMovieLabel.text!
            let movie = Movie(title: title)
            movieList.addMovie(movie: movie)
        }

        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
