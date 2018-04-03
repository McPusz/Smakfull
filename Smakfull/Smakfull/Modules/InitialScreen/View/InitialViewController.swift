//
//  InitialViewController.swift
//  Smakfull
//
//  Created by Magdusz on 03.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var loaderImageView: UIImageView!
    @IBOutlet weak var loaderErrorLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        self.retryButton.isHidden = true
    }

}
