//
//  MovieTableViewCell.swift
//  CST495-Assignment-1
//
//  Created by Samuel on 2/1/18.
//  Copyright © 2018 Samuel. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieOverviewLabel: UILabel!
    
    // For detailed view
    //var movieBackdropImageView: UIImageView!
    var movie: Movie! {
        didSet{
            movieTitleLabel.text = movie.title
            movieOverviewLabel.text = movie.overview
            movieImageView.af_setImage(withURL: movie.posterUrl!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
