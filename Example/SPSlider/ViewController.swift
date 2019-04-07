//
//  ViewController.swift
//  SPSlider
//
//  Created by ChaseStas on 03/23/2019.
//  Copyright (c) 2019 ChaseStas. All rights reserved.
//

import UIKit
import SPSlider

class ViewController: UIViewController {
    @IBOutlet private weak var verticalSliderLabel: UILabel!
    @IBOutlet private weak var horizontalSliderLabel: UILabel!

    @IBOutlet private weak var verticalSlider: SPSlider! {
        didSet {
            verticalSlider.backgroundColor = UIColor.red.withAlphaComponent(0.2)
            verticalSlider.trackTintColor = UIColor.red.withAlphaComponent(0.6)
        }
    }
    @IBOutlet private weak var horizontalSlider: SPSlider! {
        didSet {
            horizontalSlider.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
            horizontalSlider.trackTintColor = UIColor.blue.withAlphaComponent(0.6)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction private func didChangeVerticalSliderValue(_ sender: SPSlider) {
        verticalSliderLabel.text = "Value: \(NSString(format: "%.2f", sender.value))"
    }

    @IBAction private func didChangeHorizontalSliderValue(_ sender: SPSlider) {
        horizontalSliderLabel.text = "Value: \(NSString(format: "%.2f", sender.value))"
    }
}

