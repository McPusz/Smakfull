//
//  UIViewController+NavigationItem.swift
//  Smakfull
//
//  Created by Magdusz on 04.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func setupTransparentNaviBar(withTitle title: String? = nil){
        //transparency
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        //title
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationItem.title = title
    }
}
