//
//  MovieDetailViewController.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import UIKit

class MovieDetailViewController: BaseViewController {

    
    @IBOutlet weak var movieDetailTableView: UITableView!
    // presenterInterface : Access PresenterInterface Protocol Methods
    var presenterInterface: MovieDetailPresenterInterface!
    
    // presenterShippingAddressObj : Access ShippingAddressPresenter Class Methods
    var presenterObj: MovieDetailPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //setUpNavBar()
        movieDetailTableView.rowHeight = UITableView.automaticDimension
        movieDetailTableView.estimatedRowHeight = 45.0
        movieDetailTableView.backgroundColor = Color.appMainColor
    }
    
    //MARK:- SetUp navbar Method
    func setUpNavBar(){
        self.title = "Movie Detail"
        let backButton : UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "Back"), style: .plain, target: self, action: #selector(self.backBarButtonItemClicked))
        
        backButton.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        self.navigationItem.leftBarButtonItem = backButton
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let newsDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "NewsDetailViewController") as? NewsDetailViewController
        //        newsDetailVC?.article = articles[indexPath.row]
        //        self.navigationController?.pushViewController(newsDetailVC!, animated: false)
        
    }
    
}
