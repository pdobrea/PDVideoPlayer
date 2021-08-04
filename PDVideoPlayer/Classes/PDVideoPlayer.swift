//
//  PDVideoPlayer.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 16.07.2021.
//

import AVKit

public class PDVideoPlayer: NSObject {

	public let controller: AVPlayerViewController
	var url: URL
	weak var playerView: PDPlayerView?

	var showsPlaybackControls: Bool = true {
		didSet {
			controller.showsPlaybackControls = showsPlaybackControls
		}
	}

	weak var pictureInPictureDelegate: PDVideoPlayerPictureInPictureDelegate?
	weak var fullscreenPresentationDelegate: PDVideoPlayerFullscreenPresentationDelegate?
	weak var videoInformationDelegate: PDVideoPlayerVideoInformationDelegate?

	public init(url: URL) {
		self.url = url
		controller = AVPlayerViewController()
		super.init()
		controller.player = AVPlayer(url: url)
		addObserverFunctionality()
	}

	deinit {
		cleanObserverFunctionality()
	}

}
