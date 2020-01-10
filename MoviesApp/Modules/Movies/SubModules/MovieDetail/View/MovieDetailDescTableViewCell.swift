//
//  MovieDetailDescTableViewCell.swift
//  MoviesApp
//
//  Created by Adi on 1/9/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import UIKit

class MovieDetailDescTableViewCell: UITableViewCell {

    @IBOutlet var overViewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setOverViewText(overViewtext: String){
        self.overViewLabel.setTextWithLineHeight(text: overViewtext, value: 3)
    }
}
