//
//  ViewInterface.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import UIKit

protocol ViewInterface: class {
    func showLoadingProgress()
    func hideLoadingProgress()
    func showToastMessage(_ errorMessage : String?)
}
