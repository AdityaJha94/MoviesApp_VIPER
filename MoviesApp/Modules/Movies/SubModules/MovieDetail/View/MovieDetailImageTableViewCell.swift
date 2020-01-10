//
//  MovieDetailImageTableViewCell.swift
//  MoviesApp
//
//  Created by Adi on 1/9/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import UIKit

class MovieDetailImageTableViewCell: UITableViewCell {

    @IBOutlet var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addGradient()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(imageURLString: String){
        if imageURLString != ""{
            posterImageView.sd_setImage(with: URL(string: KImageBaseUrl + imageURLString), placeholderImage: UIImage(named: ""), options: .refreshCached)
        }else{
            posterImageView.image = UIImage(named: "")
        }
    }

    
    //MARK:- Add Gradient Method
    func addGradient(){
        let gradient = CAGradientLayer()
        
        gradient.frame = posterImageView.frame
        
        gradient.colors = [UIColor.clear.cgColor, Color.blackColor?.cgColor]
        
        gradient.locations = [0.0, 1.0]
        
        posterImageView.layer.insertSublayer(gradient, at: 0)
    }
}
