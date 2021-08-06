//
//  ViewController.swift
//  PDVideoPlayer
//
//  Created by Paul Dobrea on 08/03/2021.
//  Copyright (c) 2021 Paul Dobrea. All rights reserved.
//

import UIKit
import PDVideoPlayer

class ViewController: UIViewController {

	@IBOutlet private weak var videoContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
		let player = PDVideoPlayer(url: URL(string: "https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4")!)
		player.add(inViewController: self, container: videoContainer)
		player.resizable = true
		player.movable = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

