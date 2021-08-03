//
//  PDPlayerView+Pinch.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 28.07.2021.
//

import UIKit

fileprivate let minSize: CGFloat = 80.0

extension PDPlayerView {

	@objc internal func pinchAction(_ sender: UIPinchGestureRecognizer) {
		switch sender.state {
		case .began:
			startWidth = self.width.constant
			startHeight = self.height.constant
			break
		default:
			break
		}
		let width = min(max(startWidth * sender.scale, minSize), maxWidth)
		let height = min(max(startHeight * sender.scale, minSize), maxHeight)
		self.width.constant = width
		self.height.constant = height
		keepVideoSizeInBounds()
		superview?.layoutIfNeeded()
	}

}
