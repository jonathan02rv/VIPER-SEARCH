//
//  SearchPresenter.swift
//  AcronymSearch
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation

protocol SearchPresenterProtocol:class{
    
}

class SearchPresenter{
    private weak var view: SearchViewControllerProtocol?
    private var interactor: SearchInteractorProtocol
    private var router: SearchRouterProtocol
    
    init(view: SearchViewControllerProtocol, interactor: SearchInteractorProtocol, router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchPresenter: SearchPresenterProtocol{
    
}
