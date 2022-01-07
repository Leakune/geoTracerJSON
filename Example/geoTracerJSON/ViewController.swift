//
//  ViewController.swift
//  geoTracerJSON
//
//  Created by Leakune on 01/07/2022.
//  Copyright (c) 2022 Leakune. All rights reserved.
//

import geoTracerJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = .green
        mainView.addShadow()
        mainView.addCornerRadius()
    }
}

