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
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitleLabel.text = movie.title
        movieOverviewLabel.text = movie.overview
        movieReleaseDateLabel.text = movie.releaseDate
        moviePosterImageView.af_setImage(withURL: movie.posterUrl!)
        movieBannerImageView.af_setImage(withURL: movie.backdropUrl!)
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
