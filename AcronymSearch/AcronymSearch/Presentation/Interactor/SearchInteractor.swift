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
    func getAcronymFound() -> String
}

class SearchInteractor: SearchInteractorProtocol{
    var workItem: DispatchWorkItem?
    var dataInteractor: AcronymModel?
    
    weak var presenter: SearchPresenterProtocol?
    var useCase: UseCaseAcronymProtocol
    
    init(useCase: UseCaseAcronymProtocol) {
        self.useCase = useCase
    }
    
    func getMeaningAcronym(acronymText:String){
        workItem?.cancel()
        
        let newWorkItem = DispatchWorkItem { [weak self]() in
            self?.useCase.getMeaningAcronym(acronymText: acronymText) { [weak self](result) in
                switch result{
                case .success(let data):
                    self?.dataInteractor = data
                    self?.presenter?.fillDataModel(data: data.meaningList)
                case .failure(let error):
                    print(error)
                    self?.presenter?.removeAllData()
                }
            }
        }
        workItem = newWorkItem
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(50), execute: newWorkItem)
        
    }
    
    func getAcronymFound() -> String{
        guard let acronymData = dataInteractor else {return ""}
        return acronymData.name
    }
}
