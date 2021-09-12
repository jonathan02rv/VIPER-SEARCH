//
//  SearchInteractor.swift
//  AcronymSearch
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation
import Domain

protocol SearchInteractorProtocol{
    func getMeaningAcronym(acronymText:String)
}

class SearchInteractor: SearchInteractorProtocol{
    
    var dataInteractor: AcronymModel?
    
    weak var presenter: SearchPresenterProtocol?
    var useCase: UseCaseAcronymProtocol
    
    init(useCase: UseCaseAcronymProtocol) {
        self.useCase = useCase
    }
    
    func getMeaningAcronym(acronymText:String){
        
        useCase.getMeaningAcronym(acronymText: acronymText) { [weak self](result) in
            switch result{
            case .success(let data):
                self?.dataInteractor = data
                self?.presenter?.fillDataModel(data: data.meaningList)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
