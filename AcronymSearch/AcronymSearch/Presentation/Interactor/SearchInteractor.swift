//
//  SearchInteractor.swift
//  AcronymSearch
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation

protocol SearchInteractorProtocol{
    
}

class SearchInteractor: SearchInteractorProtocol{
    weak var presenter: SearchPresenterProtocol?
    
    init() {
    }
}
