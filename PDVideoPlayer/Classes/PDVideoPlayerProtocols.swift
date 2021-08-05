//
//  PDVideoPlayerProtocols.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 20.07.2021.
//

import UIKit

@objc public protocol PDVideoPlayerPictureInPictureDelegate: AnyObject {

	var automaticallyDismissAtPictureInPictureStart: Bool { get set }
	@objc optional func playerWillStartPictureInPicture()
	@objc optional func playerDidStartPictureInPicture()
	@objc optional func playerWillStopPictureInPicture()
	@objc optional func playerDidStopPictureInPicture()
	@objc optional func player(failedToStartPictureInPictureWithError error: Error)
	@objc optional func player(restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void)

}

@objc public protocol PDVideoPlayerFullscreenPresentationDelegate: AnyObject {

	@objc optional func player(willBeginFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator)
	@objc optional func player(willEndFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator)

}

@objc public protocol PDVideoPlayerVideoInformationDelegate: AnyObject {

	@objc optional func playerStartedPlaying(player: PDVideoPlayer)
	@objc optional func playerPaused(player: PDVideoPlayer)
	@objc optional func playerWaiting(player: PDVideoPlayer)
	@objc optional func playerLoadingFailed(player: PDVideoPlayer)
	@objc optional func playerReadyToPlay(player: PDVideoPlayer)
	@objc optional func playerDurationChanged(player: PDVideoPlayer, value: Double)
	@objc optional func playerLoadedDurationChanged(player: PDVideoPlayer, value: Double)
	@objc optional func playerResolutionChanged(player: PDVideoPlayer, value: CGSize)

}
