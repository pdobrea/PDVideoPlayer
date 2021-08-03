//
//  PDPlayerView+BoundsManagement.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 29.07.2021.
//

import UIKit

extension PDPlayerView {

	func keepVideoSizeInBounds() {
		let horizontalResult = horizontalBoundsResult()
		if horizontalResult.exceeds {
			width.constant = width.constant - horizontalResult.value
		}
		let verticalResult = verticalBoundsResult()
		if verticalResult.exceeds {
			height.constant = height.constant - verticalResult.value
		}
		keepVideoPositionInBounds()
	}

	func keepVideoPositionInBounds() {
		let horizontalResult = horizontalBoundsResult()
		if horizontalResult.exceeds {
			if centerX.constant < 0.0 {
				centerX.constant += horizontalResult.value
			} else {
				centerX.constant -= horizontalResult.value
			}
		}
		let verticalResult = verticalBoundsResult()
		if verticalResult.exceeds {
			if centerY.constant < 0.0 {
				centerY.constant += verticalResult.value
			} else {
				centerY.constant -= verticalResult.value
			}
		}
	}

	private func horizontalBoundsResult() -> (exceeds: Bool, value: CGFloat) {
		return centerConstraint(centerX, andSizeConstraint: width, exceedsMax: maxWidth)
	}

	private func verticalBoundsResult() -> (exceeds: Bool, value: CGFloat) {
		return centerConstraint(centerY, andSizeConstraint: height, exceedsMax: maxHeight)
	}

	private func centerConstraint(_ center: NSLayoutConstraint, andSizeConstraint size: NSLayoutConstraint, exceedsMax max: CGFloat) -> (exceeds: Bool, value: CGFloat) {
		var exceedsMax = false
		var limit: CGFloat = 0.0
		if center.constant < 0.0 {
			limit = (size.constant / 2.0) - center.constant
			if limit > max / 2.0 {
				exceedsMax = true
			}
		} else {
			limit = (size.constant / 2.0) + center.constant
			if limit > max / 2.0 {
				exceedsMax = true
			}
		}
		return (exceedsMax, limit - (max / 2.0))
	}

}
