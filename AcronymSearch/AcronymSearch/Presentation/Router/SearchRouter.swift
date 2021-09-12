//
//  SearchRouter.swift
//  AcronymSearch
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import Foundation
import UIKit

protocol SearchRouterProtocol{
    var currentView: SearchViewController? {get set}
    func startLoading()
    func stopLoading()
}

class SearchRouter{
    weak var currentView: SearchViewController?
    var activityIndicator: UIActivityIndicatorView?
    
    init(currentView: SearchViewController) {
        self.currentView = currentView
        setupActivityIndicator()
    }
    
    func setupActivityIndicator(){
        activityIndicator = UIActivityIndicatorView()
        guard let controller = currentView, let activity = activityIndicator else{return}
        activity.center = controller.view.center
        activity.hidesWhenStopped = true
        activity.style = .large
        activity.color = .systemBlue
        controller.view.addSubview(activity)
    }
}

extension SearchRouter:SearchRouterProtocol{
    func startLoading(){
        activityIndicator?.startAnimating()
    }
    
    func stopLoading(){
        DispatchQueue.main.sync {
            activityIndicator?.stopAnimating()
        }
    }
}
