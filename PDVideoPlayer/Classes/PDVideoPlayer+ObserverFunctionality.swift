//
//  PDVideoPlayer+ObserverFunctionality.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 22.07.2021.
//

import AVKit

fileprivate enum PlayerObservationKeypath: String {

	case timeControlStatus = "timeControlStatus"

	static var allValues: [PlayerObservationKeypath] {
		return [.timeControlStatus]
	}

}

fileprivate enum PlayerItemObservationKeypath: String {

	case status = "status"
	case duration = "duration"
	case presentationSize = "presentationSize"
	case loadedTimeRanges = "loadedTimeRanges"

	static var allValues: [PlayerItemObservationKeypath] {
		return [.status, .duration, .presentationSize, .loadedTimeRanges]
	}

}

extension PDVideoPlayer {

	func addObserverFunctionality() {
		for keyPath in PlayerObservationKeypath.allValues {
			controller.player?.addObserver(self, forKeyPath: keyPath.rawValue, options: .new, context: nil)
		}
		for keyPath in PlayerItemObservationKeypath.allValues {
			controller.player?.currentItem?.addObserver(self, forKeyPath: keyPath.rawValue, options: .new, context: nil)
		}
	}

	func cleanObserverFunctionality() {
		for keyPath in PlayerObservationKeypath.allValues {
			controller.player?.removeObserver(self, forKeyPath: keyPath.rawValue)
		}
		for keyPath in PlayerItemObservationKeypath.allValues {
			controller.player?.currentItem?.removeObserver(self, forKeyPath: keyPath.rawValue)
		}
	}

	public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		if let object = object, let keyPath = keyPath, let change = change {
			if object is AVPlayer {
				if let type = PlayerObservationKeypath(rawValue: keyPath) {
					handlePlayerValueChange(forKeyPath: type, change: change)
				}
			} else if object is AVPlayerItem {
				if let type = PlayerItemObservationKeypath(rawValue: keyPath) {
					handlePlayerItemValueChange(forKeyPath: type, change: change)
				}
			}
		}
	}

	private func handlePlayerValueChange(forKeyPath keyPath: PlayerObservationKeypath, change: [NSKeyValueChangeKey : Any]) {
		switch keyPath {
		case .timeControlStatus:
			if let newValue = change[.newKey] as? Int, let status = AVPlayer.TimeControlStatus(rawValue: newValue) {
				switch status {
				case .paused:
					videoInformationDelegate?.playerPaused?(player: self)
				case .playing:
					videoInformationDelegate?.playerStartedPlaying?(player: self)
				case .waitingToPlayAtSpecifiedRate:
					videoInformationDelegate?.playerWaiting?(player: self)
				default:break
				}
			}
		}
	}

	private func handlePlayerItemValueChange(forKeyPath keyPath: PlayerItemObservationKeypath, change: [NSKeyValueChangeKey : Any]) {
		switch keyPath {
		case .status:
			if let newValue = change[.newKey] as? Int, let status = AVPlayerItem.Status(rawValue: newValue) {
				switch status {
				case .failed:
					videoInformationDelegate?.playerLoadingFailed?(player: self)
				case .readyToPlay:
					videoInformationDelegate?.playerReadyToPlay?(player: self)
				default:break
				}
			}
		case .duration:
			if let newValue = change[.newKey] as? CMTime {
				let seconds = CMTimeGetSeconds(newValue)
				videoInformationDelegate?.playerDurationChanged?(player: self, value: seconds)
			}
		case .presentationSize:
			if let newValue = change[.newKey] as? CGSize {
				videoInformationDelegate?.playerResolutionChanged?(player: self, value: newValue)
			}
		case .loadedTimeRanges:
			videoInformationDelegate?.playerLoadedDurationChanged?(player: self, value: timeLoaded)
		}
	}

}
