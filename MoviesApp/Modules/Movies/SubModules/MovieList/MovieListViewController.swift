//
//  MovieListViewController.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import UIKit

class MovieListViewController: BaseViewController {

    
    @IBOutlet weak var movieListTableView: UITableView!
    
    // presenterInterface : Access PresenterInterface Protocol Methods
    var presenterInterface: MovieListPresenterInterface!
    
    // presenterShippingAddressObj : Access ShippingAddressPresenter Class Methods
    var presenterObj: MovieListPresenter!
    
    var vSpinner : UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presenterObj.viewDidLoad()
        self.movieListTableView.isHidden = true
        callAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenterObj.viewWillAppear(animated: animated)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func callAPI(){
        //self.showSpinner(onView: self.view)
        presenterObj.getAllMovies(pageIndex: 1)
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

//MARK:- Show/Hide Progress Bar
extension MovieListViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
}
