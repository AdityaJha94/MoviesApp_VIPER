//
//  MovieDetailViewController.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import UIKit

class MovieDetailViewController: BaseViewController {

    
    //MARK:- IB Outlets
    @IBOutlet weak var movieDetailTableView: UITableView!
    
    // presenterInterface : Access PresenterInterface Protocol Methods
    var presenterInterface: MovieDetailPresenterInterface!
    
    // presenterObj : Access MovieDetailPresenter Class Methods
    var presenterObj: MovieDetailPresenter!
    
    //MARK:- View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        movieDetailTableView.rowHeight = UITableView.automaticDimension
        movieDetailTableView.estimatedRowHeight = 45.0
        movieDetailTableView.backgroundColor = Color.appMainColor
    }
    
    //MARK:- Button Action
    @objc func backBarButtonItemClicked(sender: UIBarButtonItem){
        self.navigationController!.popViewController(animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenterObj.viewWillAppear(animated: animated)
    }
    
}


//MARK:- TableView Datasource and Delegate Methods
extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailImageTableViewCell") as! MovieDetailImageTableViewCell
            cell.setImage(imageURLString: presenterObj.movie?.poster_path ?? "")
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailDescTableViewCell") as! MovieDetailDescTableViewCell
            cell.setOverViewText(overViewtext: presenterObj.movie?.overview ?? "")
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 300.0
        }else{
            return UITableView.automaticDimension
        }
        
    }
    
}
