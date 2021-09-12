//
//  SearchInteractor.swift
//  AcronymSearch
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation
import Domain

protocol SearchInteractorProtocol{
    
}

class SearchInteractor: SearchInteractorProtocol{
    
    var dataInteractor: AcronymModel?
    
    weak var presenter: SearchPresenterProtocol?
    var useCase: UseCaseAcronymProtocol
    
    init(useCase: UseCaseAcronymProtocol) {
        self.useCase = useCase
    }
}
