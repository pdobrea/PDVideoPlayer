//
//  PDVideoPlayer+VideoControl.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 22.07.2021.
//

import AVKit

extension PDVideoPlayer {

	func play() {
		controller.player?.play()
	}

	func pause() {
		controller.player?.pause()
	}

	func seek(at time: Double) {
		let timeScale = controller.player?.currentTime().timescale ?? 1
		controller.player?.seek(to: CMTime(seconds: time, preferredTimescale: timeScale))
	}

	func seekForward(by time: Double) {
		var seconds: Double = 0.0
		if let currentTime = controller.player?.currentTime() {
			seconds = CMTimeGetSeconds(currentTime)
		}
		seek(at: seconds + time)
	}

	func seekBackward(by time: Double) {
		seekForward(by: -time)
	}

}
