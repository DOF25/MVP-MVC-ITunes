//
//  SearchViewIO.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 11/18/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchViewInput: AnyObject {
    
    var searchResults: [ITunesApp] { get set }
    
    func throbber(show: Bool)
    
    func showError(error: Error)
    
    func showNoResults()
    
    func hideNoResults()
}

protocol SearchViewOutput: AnyObject {
    
    func viewDidSearch(with query: String)
    
    func viewDidSelectApp(_ app: ITunesApp)
}

protocol MusicSearchViewInput: AnyObject {

    var searchResults: [ITunesSong] { get set }

    func throbber(show: Bool)

    func showError(error: Error)

    func showNoResults()

    func hideNoResults()
}

protocol MusicSearchViewOutput: AnyObject {

    func viewDidSearch(with query: String)
}
