//
//  PDVideoPlayer+AVPlayerViewControllerDelegate.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 22.07.2021.
//

import AVKit

extension PDVideoPlayer: AVPlayerViewControllerDelegate {

	func playerViewControllerWillStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
		pictureInPictureDelegate?.playerWillStartPictureInPicture?()
	}

	func playerViewControllerDidStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
		pictureInPictureDelegate?.playerDidStartPictureInPicture?()
	}

	func playerViewControllerWillStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
		pictureInPictureDelegate?.playerWillStopPictureInPicture?()
	}

	func playerViewControllerDidStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
		pictureInPictureDelegate?.playerDidStopPictureInPicture?()
	}

	func playerViewController(_ playerViewController: AVPlayerViewController, failedToStartPictureInPictureWithError error: Error) {
		pictureInPictureDelegate?.player?(failedToStartPictureInPictureWithError: error)
	}

	func playerViewController(_ playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
		pictureInPictureDelegate?.player?(restoreUserInterfaceForPictureInPictureStopWithCompletionHandler: completionHandler)
	}

	func playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart(_ playerViewController: AVPlayerViewController) -> Bool {
		return pictureInPictureDelegate?.automaticallyDismissAtPictureInPictureStart ?? true
	}

	func playerViewController(_ playerViewController: AVPlayerViewController, willBeginFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator) {
		fullscreenPresentationDelegate?.player?(willBeginFullScreenPresentationWithAnimationCoordinator: coordinator)
	}

	func playerViewController(_ playerViewController: AVPlayerViewController, willEndFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator) {
		fullscreenPresentationDelegate?.player?(willEndFullScreenPresentationWithAnimationCoordinator: coordinator)
	}

}
