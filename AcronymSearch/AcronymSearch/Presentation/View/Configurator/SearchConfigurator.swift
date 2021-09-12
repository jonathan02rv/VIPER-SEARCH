//
//  SearchConfigurator.swift
//  AcronymSearch
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation

protocol SearchConfiguratorProtocol{
    func configure(_ controller: SearchViewController)
}

class SearchConfigurator: SearchConfiguratorProtocol{
    func configure(_ controller: SearchViewController){
        let router = SearchRouter(currentView: controller)
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(view: controller, interactor: interactor, router: router)
        controller.presenter = presenter
        interactor.presenter = presenter
        
        
    }
}
