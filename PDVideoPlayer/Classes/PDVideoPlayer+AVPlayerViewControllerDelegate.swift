//
//  PDVideoPlayer+AVPlayerViewControllerDelegate.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 22.07.2021.
//

import AVKit

extension PDVideoPlayer: AVPlayerViewControllerDelegate {

	public func playerViewControllerWillStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
		pictureInPictureDelegate?.playerWillStartPictureInPicture?()
	}

	public func playerViewControllerDidStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
		pictureInPictureDelegate?.playerDidStartPictureInPicture?()
	}

	public func playerViewControllerWillStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
		pictureInPictureDelegate?.playerWillStopPictureInPicture?()
	}

	public func playerViewControllerDidStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
		pictureInPictureDelegate?.playerDidStopPictureInPicture?()
	}

	public func playerViewController(_ playerViewController: AVPlayerViewController, failedToStartPictureInPictureWithError error: Error) {
		pictureInPictureDelegate?.player?(failedToStartPictureInPictureWithError: error)
	}

	public func playerViewController(_ playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
		pictureInPictureDelegate?.player?(restoreUserInterfaceForPictureInPictureStopWithCompletionHandler: completionHandler)
	}

	public func playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart(_ playerViewController: AVPlayerViewController) -> Bool {
		return pictureInPictureDelegate?.automaticallyDismissAtPictureInPictureStart ?? true
	}

	public func playerViewController(_ playerViewController: AVPlayerViewController, willBeginFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator) {
		fullscreenPresentationDelegate?.player?(willBeginFullScreenPresentationWithAnimationCoordinator: coordinator)
	}

	public func playerViewController(_ playerViewController: AVPlayerViewController, willEndFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator) {
		fullscreenPresentationDelegate?.player?(willEndFullScreenPresentationWithAnimationCoordinator: coordinator)
	}

}
