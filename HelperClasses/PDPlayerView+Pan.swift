//
//  PDPlayerView+Pan.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 28.07.2021.
//

import UIKit

extension PDPlayerView {

	@objc internal func panAction(_ sender: UIPinchGestureRecognizer) {
		switch sender.state {
		case .began:
			panStartPoint = sender.location(in: self.superview)
			startCenterX = centerX.constant
			startCenterY = centerY.constant
			break
		default:
			let deltaX = -(panStartPoint.x - sender.location(in: superview).x)
			let deltaY = -(panStartPoint.y - sender.location(in: superview).y)
			centerX.constant = startCenterX + deltaX
			centerY.constant = startCenterY + deltaY
			keepVideoPositionInBounds()
			superview?.layoutIfNeeded()
			break
		}
	}

	

}
