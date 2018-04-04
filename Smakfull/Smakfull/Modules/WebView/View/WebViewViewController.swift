//
//  WebViewViewController.swift
//  Smakfull
//
//  Created by Magdusz on 04.04.2018.
//  Copyright © 2018 com.mcpusz.smakfull. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var closeButton: UIButton!
    
    var url: URL? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupWebView()
    }
    
    private func setupWebView() {
        if let url = url, let htmlData = try? Data(contentsOf: url) {
            webView.load(htmlData, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: url)
        }
    }

    @IBAction func closeWebView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
