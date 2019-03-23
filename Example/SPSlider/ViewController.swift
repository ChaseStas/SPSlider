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
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction private func didChangeVerticalSliderValue(_ sender: SPSlider) {
        print("Vertical slider value: \(sender.value)")
    }

    @IBAction private func didChangeHorizontalSliderValue(_ sender: SPSlider) {
        print("Horizontal slider value: \(sender.value)")
    }
}

