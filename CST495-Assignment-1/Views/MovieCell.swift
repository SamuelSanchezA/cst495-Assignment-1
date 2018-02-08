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
    var movieBackdropImageView: UIImageView!
    
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
