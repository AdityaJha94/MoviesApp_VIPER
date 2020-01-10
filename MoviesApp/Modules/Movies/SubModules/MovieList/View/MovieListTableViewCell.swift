//
//  MovieListTableViewCell.swift
//  MoviesApp
//
//  Created by Adi on 1/8/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import UIKit
import SDWebImage

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var overViewLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var releaseYearLabel: UILabel!
    @IBOutlet var averageVoteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 1, green: 0.8431, blue: 0, alpha: 1.0)
        selectedBackgroundView = backgroundView
    }
    
    func setMovieValues(movie: Movie){
        if let title = movie.original_title{
            titleLabel.text = title
        }
        
        if let overview = movie.overview{
            overViewLabel.setTextWithLineHeight(text: overview, value: 2)
        }
        
        if let voteAverage = movie.vote_average{
            averageVoteLabel.text = String(voteAverage)
        }
        
        if let releaseDate = movie.release_date{
            releaseYearLabel.text = MovieUtil.getRequiredDateString(dateString: releaseDate, passedDateFormat: "yyyy-MM-dd", requiredDateFormat: "yyyy")
        }
        
        if let urlMovieImage = movie.poster_path{
            posterImageView.sd_setImage(with: URL(string: KImageBaseUrl + urlMovieImage), placeholderImage: UIImage(named: ""), options: .refreshCached)
        }else{
            posterImageView.image = UIImage(named: "")
        }
    }
    
    
    

}
