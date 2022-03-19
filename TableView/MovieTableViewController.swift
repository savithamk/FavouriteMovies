//
//  MovieTableViewController.swift
//  TableView
//
//  Created by Savitha M K on 2022-03-18.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    let movieList = MovieList(autofil: true)
    
    //Button to toggle edit mode
    @IBAction func toggleEditMode(_ sender: UIBarButtonItem) {
        if isEditing {
            sender.title = "Edit"
            
            setEditing(false, animated: true)
        } else {
            sender.title = "Done"
            setEditing(true, animated: true)
        }
    }
    
    var keys: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        //To get number of rows
        return movieList.movies.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie", for: indexPath)
       
        //To display each row number with movie name
        let movie = movieList.movies[indexPath.row]
        cell.textLabel?.text = String(indexPath.row+1) + ". " + movie
        
        return cell
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        movieList.moveMovie(fromIndexPath: fromIndexPath, toIndexPath: to)
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            movieList.removeMovie(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let dst = segue.destination as! addMovieViewController
                dst.movieList = movieList
    }
    

}
