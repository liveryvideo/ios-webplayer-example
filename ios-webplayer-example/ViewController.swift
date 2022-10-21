//
//  ViewController.swift
//  ios-webplayer-example
//
//  Created by Jose Nogueira on 21/10/2022.
//

import UIKit
import OSLog
import WebKit

class ViewController: UIViewController {

    // MARK: - UI Properties
    private var webPlayer: WebPlayer!
    
    // MARK: - Properties
    private var testStreamID = "5ddb98f5e4b0937e6a4507f2"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        webPlayer.load(streamID: testStreamID)
    }
}

// MARK: - Setup UI
extension ViewController {
    private func setupUI() {
        webPlayer = WebPlayer()
        view.addSubview(webPlayer)
        webPlayer.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            webPlayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webPlayer.topAnchor.constraint(equalTo: margins.topAnchor),
            webPlayer.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            webPlayer.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
