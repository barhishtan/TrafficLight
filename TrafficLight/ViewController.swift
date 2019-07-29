//
//  ViewController.swift
//  TrafficLight
//
//  Created by Artur Sokolov on 24/07/2019.
//  Copyright © 2019 Artur Sokolov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lighterViews: [UIView]!
    
    private var lighterID = 0
    private let offLighter: CGFloat = 0.3
    private let onLighter: CGFloat = 1
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        for view in lighterViews {
            view.layer.cornerRadius = view.frame.width * 0.5
            view.alpha = offLighter
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lighterViews[0].backgroundColor = .red
        lighterViews[1].backgroundColor = .yellow
        lighterViews[2].backgroundColor = .green
    }
    
    @IBAction func startLighter(_ sender: UIButton) {
        sender.setTitle("Next", for: .normal)
        let viewsMaxIndex = lighterViews.count - 1
        
        switch lighterID {
        case 0:
            lighterViews[viewsMaxIndex].alpha = offLighter
        case 1...viewsMaxIndex:
            lighterViews[lighterID - 1].alpha = offLighter
        default:
            break
        }
        
        lighterViews[lighterID].alpha = onLighter
        lighterID += 1
        if lighterID > viewsMaxIndex { lighterID = 0 }
    }
    
}

