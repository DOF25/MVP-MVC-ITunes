//
//  SearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 11/18/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

// этот объект собирает мне модуль MVP для поиска

class SearchBuilder {
    static func buildAppSearch() -> SearchViewController {
        let view = SearchViewController()
        
        let presenter = SearchPresenter(searchService: ITunesSearchService())
        
        view.output = presenter
        presenter.view = view
        
        return view
    }

    static func buildSongSearch() -> MusicSearchController {

        let view = MusicSearchController()

        let presenter = MusicSearchPresenter(searchService: ITunesSearchService())

        view.output = presenter
        presenter.view = view

        return view
    }

}
