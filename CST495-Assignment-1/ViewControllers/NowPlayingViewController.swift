//
//  NowPlayingViewController.swift
//  CST495-Assignment-1
//
//  Created by Samuel on 2/1/18.
//  Copyright © 2018 Samuel. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController, UITableViewDataSource{

    @IBOutlet var movieTableView: UITableView!
    //var movies : [[String: Any]] = []
    var refreshControl : UIRefreshControl!
    var filteredData: [String]!
    
    var movies: [Movie] = []
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Now Playing"
        
        activityIndicator.startAnimating()
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        movieTableView.insertSubview(refreshControl, at: 0)
        movieTableView.dataSource = self
        movieTableView.rowHeight = UITableViewAutomaticDimension
        movieTableView.estimatedRowHeight = 50
        fetchMovies()
        activityIndicator.stopAnimating()
    }

    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchMovies()
    }
    
    func fetchMovies(){
        
        let alertController = UIAlertController(title: "Cannot Get Movies", message: "The Internet Connection appears to be offline", preferredStyle: .alert)
        
        // create a cancel action
        let tryAgainAction = UIAlertAction(title: "Try Again", style: .default) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
            self.fetchMovies()
        }
        // add the cancel action to the alertController
        alertController.addAction(tryAgainAction)
        
        MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.movieTableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.movie = movies[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! DetailedMovieViewController
        let senderCell = sender as! MovieCell
        if let indexPath = movieTableView.indexPath(for: senderCell){
            destVC.movie = movies[indexPath.row]
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
