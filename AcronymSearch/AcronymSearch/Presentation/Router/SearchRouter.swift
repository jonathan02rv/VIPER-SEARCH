//
//  SearchRouter.swift
//  AcronymSearch
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation

protocol SearchRouterProtocol{
    var currentView: SearchViewController? {get set}
}

class SearchRouter{
    weak var currentView: SearchViewController?
    
    init(currentView: SearchViewController) {
        self.currentView = currentView
    }
}

extension SearchRouter:SearchRouterProtocol{
    
}
