//
//  VersionView.swift
//  iOSArchitecturesDemo
//
//  Created by Крылов Данила  on 27.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class VersionView: UIView {

//MARK: - Private property

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Что нового?"
        label.numberOfLines = 1
        return label
    }()

    let versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 1
        return label
    }()

    let dateOfReleaseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 1
        return label
    }()

    let releaseDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()

//MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        configureUI()
    }

    private func configureUI() {
        self.addSubview(titleLabel)
        self.addSubview(versionLabel)
        self.addSubview(dateOfReleaseLabel)
        self.addSubview(releaseDescriptionLabel)
        setupConstraints()
    }

    private func setupConstraints() {

        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 6),
            self.titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 2),
            self.versionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            self.versionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 2),
            self.dateOfReleaseLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            self.dateOfReleaseLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
                                                             constant: -2),
            self.releaseDescriptionLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 6),
            self.releaseDescriptionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 2),
            self.releaseDescriptionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 2)
            
        ])
    }

}
