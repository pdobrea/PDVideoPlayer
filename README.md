# PDVideoPlayer

[![CI Status](https://img.shields.io/travis/pdobrea/PDVideoPlayer.svg?style=flat)](https://travis-ci.org/pdobrea/PDVideoPlayer)
[![Version](https://img.shields.io/cocoapods/v/PDVideoPlayer.svg?style=flat)](https://cocoapods.org/pods/PDVideoPlayer)
[![License](https://img.shields.io/cocoapods/l/PDVideoPlayer.svg?style=flat)](https://cocoapods.org/pods/PDVideoPlayer)
[![Platform](https://img.shields.io/cocoapods/p/PDVideoPlayer.svg?style=flat)](https://cocoapods.org/pods/PDVideoPlayer)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

`let player = PDVideoPlayer(url: URL(string: "https://www.url.to/my/video.mp4")!)`
`player.add(inViewController: self, container: videoContainer)`

	- where `self` is the `UIViewController` in which you put your video player and `videoContainer` is the superview of the video itself.
	
`player.remove()` - to remove the player from its superview and clean the observers set on it
	
## Properties

`showsPlaybackControls`
- set to `false` to hide default user inteface, in case you want to create your own custom control UI

`resizable`
- set to `true` to enable the `UIPinchGestureRecognizer` that allows you to resize the video frame within its superview bounds

`movable`
- set to `true` to enable the `UIPanGestureRecognizer` that allows you to move the video within its superview bounds

`func getThumbnail(atTime seconds: Double) -> UIImage?`
- gets an `UIImage` object with the frame of the video at the provided time in the `seconds` parameter

## Delegates

`pictureInPictureDelegate`
- notifies you of different PIP-related functionality events, such as `playerDidStartPictureInPicture` or `playerDidStopPictureInPicture`

`fullscreenPresentationDelegate`
- notifies you of when fullscreen presentation begins and ends

`videoInformationDelegate`
- notifies you when the player is ready to play, pauses, changes properties such as resolution, duration etc.

## Requirements

iOS 14.0, Swift 5.0

## Installation

PDVideoPlayer is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PDVideoPlayer'
```

## Author

Paul Dobrea, paul.dobrea@gmail.com

## License

PDVideoPlayer is available under the MIT license. See the LICENSE file for more info.
