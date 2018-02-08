//
//  DetailedMovieViewController.swift
//  CST495-Assignment-1
//
//  Created by Samuel on 2/7/18.
//  Copyright © 2018 Samuel. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailedMovieViewController: UIViewController {

    @IBOutlet var movieBannerImageView: UIImageView!
    @IBOutlet var moviePosterImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieReleaseDateLabel: UILabel!
    @IBOutlet var movieOverviewLabel: UILabel!
    
    var movie: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie{
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let moviePosterPath = movie["poster_path"] as! String
            let movieBannerPath = movie["backdrop_path"] as! String
            movieTitleLabel.text = movie["title"] as? String
            movieOverviewLabel.text = movie["overview"] as? String
            movieReleaseDateLabel.text = movie["release_date"] as? String
            moviePosterImageView.af_setImage(withURL: URL(string: baseURLString + moviePosterPath)!)
            movieBannerImageView.af_setImage(withURL: URL(string: baseURLString + movieBannerPath)!)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showTrailer(_ sender: Any) {
        performSegue(withIdentifier: "movieTrailerSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destVC = segue.destination as! MovieTrailerViewController
        destVC.movie = movie
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
