//
//  MovieListViewController.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import UIKit

class MovieListViewController: BaseViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var movieListTableView: UITableView!
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var loaderImageView: UIImageView!
    @IBOutlet weak var sectionFooterHeightConstraint: NSLayoutConstraint!
    
    // presenterInterface : Access PresenterInterface Protocol Methods
    var presenterInterface: MovieListPresenterInterface!
    
    // presenterShippingAddressObj : Access ShippingAddressPresenter Class Methods
    var presenterObj: MovieListPresenter!
    
    
    
    
    //MARK:- View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presenterObj.viewDidLoad()
        self.movieListTableView.isHidden = true
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenterObj.viewWillAppear(animated: animated)
    }

    
    //MARK:- Required SetUp Method
    func setUp(){
        presenterObj.page = 1
        callAPI()
        sectionFooterHeightConstraint.constant = 0
        loaderView.isHidden = true
        let appLoaderGIF = UIImage.gifImageWithName("app_loader2")
        loaderImageView.image = appLoaderGIF
    }
    
    
    //MARK:- Call API
    func callAPI(){
        //self.showSpinner(onView: self.view)
        presenterObj.getAllMovies(pageIndex: presenterObj.page)
    }

}

//MARK:- TableView Datasource and Delegate Methods
extension MovieListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenterObj.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as! MovieListTableViewCell
        cell.setMovieValues(movie: presenterObj.movies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 200.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenterObj.navigateToMovieDetail(movie: presenterObj.movies[indexPath.row])
    }
    
}

//Scrollview delegate methods for pagination are commented for now.

//MARK:- Scroll View Delegate Methods
extension MovieListViewController{
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging")
        presenterObj.isDataLoading = false
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging")
        presenterObj.callApiForPagination()
    }
    
}
