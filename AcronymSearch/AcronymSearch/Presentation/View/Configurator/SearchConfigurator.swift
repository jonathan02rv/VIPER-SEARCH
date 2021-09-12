//
//  SearchConfigurator.swift
//  AcronymSearch
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation
import Domain
import Data

protocol SearchConfiguratorProtocol{
    func configure(_ controller: SearchViewController)
}

class SearchConfigurator: SearchConfiguratorProtocol{
    func configure(_ controller: SearchViewController){
        let router = SearchRouter(currentView: controller)
        
        let useCase = UseCaseAcronym(repository: RepositoryAcronym())
        let interactor = SearchInteractor(useCase: useCase)
        let presenter = SearchPresenter(view: controller, interactor: interactor, router: router)
        controller.presenter = presenter
        interactor.presenter = presenter
        
        
    }
}
