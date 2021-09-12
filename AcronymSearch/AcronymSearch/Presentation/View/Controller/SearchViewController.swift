//
//  SearchViewController.swift
//  AcronymSearch
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import UIKit

protocol SearchViewControllerProtocol: class{
    func reloadTable()
    func setTitleView(title: String)
}

class SearchViewController: UITableViewController {
    
    var searchController: UISearchController!
    
    var presenter:SearchPresenterProtocol!
    let configurator = SearchConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        configurator.configure(self)
        setupSearchBarController()
        setupTableView()
    }
    
    func setupTableView(){
        self.tableView.register(HeaderViewCell.nib(), forCellReuseIdentifier: HeaderViewCell.identifier)
        self.tableView.register(RowViewCell.nib(), forCellReuseIdentifier: RowViewCell.identifier)
    }

    
    func setupSearchBarController(){
        searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        navigationItem.searchController = searchController
        self.title = "Acronyms"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

}

extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        guard let inputText = searchController.searchBar.text?.trimmingCharacters(in: CharacterSet.whitespaces), !inputText.isEmpty else{return}
        presenter.searcMeaning(acronymText: inputText)
    }
}

extension SearchViewController{
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderViewCell.identifier) as! HeaderViewCell
        cell.txtTitle.text = "Section \(section+1): \(presenter.getSectionName(section: section))"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        let count = presenter.getNumberOfSection()
        return count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RowViewCell.identifier, for: indexPath) as! RowViewCell
        let dataRow = presenter.getDataRow(indexPath: indexPath)
        cell.txtMeaning.text = "Meaning \(indexPath.row+1): \(dataRow.description)"
        cell.txtYear.text = "Year: \(dataRow.year)"
        return cell
    }
}


extension SearchViewController:SearchViewControllerProtocol{
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func setTitleView(title: String){
        DispatchQueue.main.async {
            self.title = title
        }
    }
}
