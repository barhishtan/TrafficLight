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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for view in lighterViews {
            view.layer.cornerRadius = view.bounds.size.width * 0.5
            view.clipsToBounds = true
            view.alpha = 0.3
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
            lighterViews[viewsMaxIndex].alpha = 0.3
        case 1...viewsMaxIndex:
            lighterViews[lighterID - 1].alpha = 0.3
        default:
            break
        }
        
        lighterViews[lighterID].alpha = 1
        lighterID += 1
        if lighterID > viewsMaxIndex { lighterID = 0 }
    }
    
}

