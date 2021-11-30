//
//  MusicCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Крылов Данила  on 30.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

struct MusicCellModel {
    let artistName: String?
    let songName: String?
    let albomImage: UIImage
}

final class MusicCellModelFactory {

    static func createMusicModel(song: ITunesSong) -> MusicCellModel {

        let artistName = song.artistName
        let songName = song.trackName
        let urlForImage = URL(string: song.artwork ?? "")
        let dataImage = try? Data(contentsOf: urlForImage ?? URL(fileURLWithPath: ""))
        let albomImage = UIImage(data: dataImage ?? Data(), scale: 1.0)
        return MusicCellModel(artistName: artistName,
                              songName: songName,
                              albomImage: albomImage ?? UIImage())
    }
}
