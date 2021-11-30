//
//  VersionController.swift
//  iOSArchitecturesDemo
//
//  Created by Крылов Данила  on 27.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class VersionController: UIViewController {

    private var versionView: VersionView {
        return self.view as! VersionView
    }

    override func loadView() {
        self.view = VersionView()
    }

    private let app: ITunesApp
    private let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .none
        return df
    }()

    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }

    private func fillData() {
        let date = ISO8601DateFormatter().date(from: app.currentVersionReleaseDate ?? "")

        self.versionView.versionLabel.text = app.currentVersion
        self.versionView.dateOfReleaseLabel.text = dateFormatter.string(from: date ?? Date())
        self.versionView.releaseDescriptionLabel.text = app.currentVersionDescription
    }

    public func calculateHeightOfDescription(text: String) -> CGFloat {
        let approxWidthOfText = self.view.bounds.width - 4
        let size = CGSize(width: approxWidthOfText, height: .greatestFiniteMagnitude)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: text)
            .boundingRect(with: size,
                          options:.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.height
    }
}

