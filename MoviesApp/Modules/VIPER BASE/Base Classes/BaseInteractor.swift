//
//  BaseInteractor.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import RxSwift

class BaseInteractor  {
    var primaryErrorMsgObserver = Variable<String>("")
    var secondaryErrorMsgObserver = Variable<String>("")
    var isLoadingObserver = Variable<Bool>(false)
}
