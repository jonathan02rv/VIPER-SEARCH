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
    func SuccessResultPresenter(data: [MeaningModel])
    func getSectionName(section: Int)->String
    func getNumberOfSection()->Int
    func numberOfRowsInSection(section: Int)->Int
    func getDataRow(indexPath: IndexPath)->VariantModel
    func FailedResultPresenter()
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
        self.router.startLoading()
        self.interactor.getMeaningAcronym(acronymText: acronymText)
    }
    
    func SuccessResultPresenter(data: [MeaningModel]){
        self.router.stopLoading()
        self.view?.setTitleView(title: "Acronym: \(interactor.getAcronymFound())")
        viewData = data
        self.view?.reloadTable()
    }
    
    func FailedResultPresenter(){
        self.router.stopLoading()
        self.view?.setTitleView(title: "Acronyms")
        viewData.removeAll()
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
}
