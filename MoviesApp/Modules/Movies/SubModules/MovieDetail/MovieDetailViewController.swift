//
//  MovieDetailViewController.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import UIKit

class MovieDetailViewController: BaseViewController {

    
    // presenterInterface : Access PresenterInterface Protocol Methods
    var presenterInterface: MovieDetailPresenterInterface!
    
    // presenterShippingAddressObj : Access ShippingAddressPresenter Class Methods
    var presenterObj: MovieDetailPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
