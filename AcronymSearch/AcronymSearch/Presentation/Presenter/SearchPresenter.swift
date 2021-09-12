//
//  SearchPresenter.swift
//  AcronymSearch
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation
import Domain

protocol SearchPresenterProtocol:class{
    func searcMeaning(acronymText: String)
    func fillDataModel(data: [MeaningModel])
    func getSectionName(section: Int)->String
    func getNumberOfSection()->Int
    func numberOfRowsInSection(section: Int)->Int
    func getDataRow(indexPath: IndexPath)->VariantModel
    func removeAllData()
}

class SearchPresenter{
    private weak var view: SearchViewControllerProtocol?
    private var interactor: SearchInteractorProtocol
    private var router: SearchRouterProtocol
    
    var viewData = [MeaningModel]()
    
    init(view: SearchViewControllerProtocol, interactor: SearchInteractorProtocol, router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchPresenter: SearchPresenterProtocol{
    func searcMeaning(acronymText: String){
        self.interactor.getMeaningAcronym(acronymText: acronymText)
    }
    
    func fillDataModel(data: [MeaningModel]){
        viewData = data
        self.view?.reloadTable()
    }
    
    func getSectionName(section: Int)->String{
        viewData[section].description
    }
    
    func getNumberOfSection()->Int{
        viewData.count
    }
    
    func numberOfRowsInSection(section: Int)->Int{
        viewData[section].variantList.count
    }
    
    func getDataRow(indexPath: IndexPath)->VariantModel{
        viewData[indexPath.section].variantList[indexPath.row]
    }
    
    func removeAllData(){
        viewData.removeAll()
    }
}
