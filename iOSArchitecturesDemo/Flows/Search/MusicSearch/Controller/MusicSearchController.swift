//
//  MusicSearchController.swift
//  iOSArchitecturesDemo
//
//  Created by Крылов Данила  on 29.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class MusicSearchController: UIViewController, MusicSearchViewInput  {

    private var searchView: SearchView {
        return self.view as! SearchView
    }

    var searchResults = [ITunesSong]() {
        didSet {
            self.searchView.searchBar.resignFirstResponder()
            self.searchView.tableView.isHidden = self.searchResults.isEmpty
            self.searchView.tableView.reloadData()
        }
    }

    var output: MusicSearchViewOutput!

    private struct Constants {
        static let reuseID = "cell"
    }

//MARK: -Life Cycle

    override func loadView() {
        super.loadView()
        self.view = SearchView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchView.tableView.delegate = self
        self.searchView.tableView.dataSource = self
        self.searchView.searchBar.delegate = self
        self.searchView.tableView.register(MusicCell.self, forCellReuseIdentifier: Constants.reuseID)
    }

    
//MARK: - MusicSearchViewInput
    func throbber(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }

    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }

    func showNoResults() {
        self.searchView.emptyResultView.isHidden = false
    }

    func hideNoResults() {
        self.searchView.emptyResultView.isHidden = true
    }

}

//MARK: - UITableViewDelegate

extension MusicSearchController: UITableViewDelegate {

}

//MARK: - UITableViewDataSource

extension MusicSearchController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseID, for: indexPath) as?
                MusicCell else { return UITableViewCell() }
        let song = searchResults[indexPath.row]
        let cellModel = MusicCellModelFactory.createMusicModel(song: song)
        cell.configure(songModel: cellModel)
        return cell
    }
    
}

//MARK: - UISearchBarDelegate


extension MusicSearchController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }

        self.output.viewDidSearch(with: query)
    }
    
}
