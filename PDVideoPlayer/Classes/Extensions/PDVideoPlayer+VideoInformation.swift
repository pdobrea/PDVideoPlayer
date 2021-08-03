//
//  PDVideoPlayer+VideoInformation.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 22.07.2021.
//

import AVKit

extension PDVideoPlayer {

	var videoDuration: Double {
		var videoDuration = 0.0
		if let duration = controller.player?.currentItem?.duration {
			videoDuration = CMTimeGetSeconds(duration)
		}
		return videoDuration
	}

	var timeLoaded: Double {
		var loaded = 0.0
		if let range = controller.player?.currentItem?.loadedTimeRanges.first {
			let time = CMTimeRangeGetEnd(range.timeRangeValue)
			loaded = CMTimeGetSeconds(time)
		}
		return loaded
	}

	var currentTime: Double {
		return controller.player?.currentTime().seconds ?? 0.0
	}

}
