//
//  MusicSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Крылов Данила  on 30.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class MusicSearchPresenter: MusicSearchViewOutput {

    weak var view: (UIViewController & MusicSearchViewInput)!

    private let searchService: ITunesSearchService

    init(searchService: ITunesSearchService) {
        self.searchService = searchService
    }

    
    func viewDidSearch(with query: String) {
        self.requestApps(with: query)
    }

    private func requestApps(with query: String) {
        self.view.throbber(show: true)
        self.view.searchResults = []
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.view.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.view.searchResults = []
                        self.view.showNoResults()
                        return
                    }
                    self.view.hideNoResults()
                    self.view.searchResults = songs
                }
                .withError {
                    self.view.showError(error: $0)
                }
        }
    }
}
