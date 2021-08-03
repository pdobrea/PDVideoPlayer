//
//  PDVideoPlayer+Gestures.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 28.07.2021.
//

import AVKit

extension PDVideoPlayer {

	var resizable: Bool {
		get {
			return playerView?.resizable ?? false
		}
		set {
			playerView?.resizable = newValue
		}
	}

	var movable: Bool {
		get {
			return playerView?.movable ?? false
		}
		set {
			playerView?.movable = newValue
		}
	}

}
