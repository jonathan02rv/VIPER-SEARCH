//
//  SearchViewController.swift
//  AcronymSearch
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import UIKit

protocol SearchViewControllerProtocol: class{
    func reloadTable()
}

class SearchViewController: UITableViewController {
    var searchController: UISearchController!
    
    var presenter:SearchPresenterProtocol!
    let configurator = SearchConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupView(){
        configurator.configure(self)
        setupSearchBar()
        setupTableView()
    }
    
    
    func setupTableView(){
        self.tableView.register(HeaderViewCell.nib(), forCellReuseIdentifier: HeaderViewCell.identifier)
        self.tableView.register(RowViewCell.nib(), forCellReuseIdentifier: RowViewCell.identifier)
    }
    
    func setupSearchBar(){
        searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        self.title = "Acronyms"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

}

extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        guard let inputText = searchController.searchBar.text?.trimmingCharacters(in: CharacterSet.whitespaces) else{return}
        print(inputText)
        presenter.searcMeaning(acronymText: "HMM")
    }
    
}

extension SearchViewController{
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderViewCell.identifier) as! HeaderViewCell
        cell.txtTitle.text = "Title 1"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Int.random(in: 1..<3)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int.random(in: 1..<5)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RowViewCell.identifier, for: indexPath) as! RowViewCell
        cell.txtMeaning.text = "item \(indexPath.row)"
        return cell
    }
}


extension SearchViewController:SearchViewControllerProtocol{
    func reloadTable() {
        self.tableView.reloadData()
    }
    
}
