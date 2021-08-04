//
//  PDVideoPlayer+Thumbnail.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 27.07.2021.
//

import AVKit

public extension PDVideoPlayer {

	func getThumbnail(atTime seconds: Double) -> UIImage? {
		var image: UIImage?
		let asset = AVAsset(url: url)
		let imageGenerator = AVAssetImageGenerator(asset: asset)
		imageGenerator.appliesPreferredTrackTransform = true
		imageGenerator.requestedTimeToleranceBefore = CMTime.zero
		imageGenerator.requestedTimeToleranceAfter = CMTime.zero
		let composition = AVVideoComposition(propertiesOf: asset)
		let time = CMTimeMakeWithSeconds(seconds, preferredTimescale: composition.frameDuration.timescale)
		do {
			let imageRef = try imageGenerator.copyCGImage(at: time, actualTime: nil)
			image = UIImage(cgImage: imageRef)
		} catch {}
		return image
	}

}
