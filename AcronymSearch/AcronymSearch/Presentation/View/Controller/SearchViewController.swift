//
//  SearchViewController.swift
//  AcronymSearch
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import UIKit

class SearchViewController: UITableViewController {
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        // Do any additional setup after loading the view.
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
        self.tableView.reloadData()
    }
    
}

extension SearchViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int.random(in: 1..<5)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "item \(indexPath.row)"
        return cell
    }
}
