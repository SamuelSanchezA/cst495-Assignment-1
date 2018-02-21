//
//  PosterCell.swift
//  CST495-Assignment-1
//
//  Created by Samuel on 2/7/18.
//  Copyright © 2018 Samuel. All rights reserved.
//

import UIKit

class PosterCell: UICollectionViewCell {
    @IBOutlet weak var moviePosterImageView: UIImageView!
    var movie: Movie! {
        didSet{
            moviePosterImageView.af_setImage(withURL: movie.posterUrl!)
        }
    }
}
