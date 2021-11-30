//
//  MusicCell.swift
//  iOSArchitecturesDemo
//
//  Created by Крылов Данила  on 29.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class MusicCell: UITableViewCell {

    private let albomImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let songName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.numberOfLines = 1
        return label
    }()

    private let artistName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 1
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        self.albomImage.image = nil
        self.songName.text = nil
        self.artistName.text = nil
    }

    private func setupUI() {

        self.contentView.addSubview(albomImage)
        self.contentView.addSubview(songName)
        self.contentView.addSubview(artistName)

        NSLayoutConstraint.activate([

            self.albomImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            self.albomImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            self.albomImage.heightAnchor.constraint(equalToConstant: 45),
            self.albomImage.widthAnchor.constraint(equalTo: albomImage.heightAnchor),
            self.songName.leadingAnchor.constraint(equalTo: albomImage.trailingAnchor, constant: 4),
            self.songName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            self.artistName.leadingAnchor.constraint(equalTo: albomImage.trailingAnchor, constant: 4),
            self.artistName.topAnchor.constraint(equalTo: songName.bottomAnchor, constant: 2)
        ])
    }

    func configure(songModel: MusicCellModel) {
        self.albomImage.image = songModel.albomImage
        self.songName.text = songModel.songName
        self.artistName.text = songModel.artistName
    }
}
