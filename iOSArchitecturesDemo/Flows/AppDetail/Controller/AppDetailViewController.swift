//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    public var app: ITunesApp!
    
    private lazy var appDetailHeader = AppDetailHeaderViewController(app: app)
    private lazy var versionView = VersionController(app: app)
    
    private var appDetailView: AppDetailView {
        return self.view as! AppDetailView
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        self.setupAppDetailHeaderViewController()
        setupVersionViewController()
        self.configureNavigationController()
        self.addDescription()
    }
    
    private func setupAppDetailHeaderViewController() {
        self.addChild(self.appDetailHeader)
        
        self.view.addSubview(self.appDetailHeader.view)
        self.appDetailHeader.didMove(toParent: self)
        
        self.appDetailHeader.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.appDetailHeader.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.appDetailHeader.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.appDetailHeader.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }

    private func setupVersionViewController() {
        self.addChild(self.versionView)

        self.view.addSubview(self.versionView.view)
        self.versionView.didMove(toParent: self)

        self.versionView.view.translatesAutoresizingMaskIntoConstraints = false

        let descriptionHeight = versionView.calculateHeightOfDescription(text: app.currentVersionDescription ?? "")
        NSLayoutConstraint.activate([
            self.versionView.view.topAnchor.constraint(equalTo: self.appDetailHeader.view.bottomAnchor),
            self.versionView.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.versionView.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.versionView.view.heightAnchor.constraint(equalToConstant: descriptionHeight )
        ])

    }
    
    private func configureNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addDescription() {
        
    }
}
