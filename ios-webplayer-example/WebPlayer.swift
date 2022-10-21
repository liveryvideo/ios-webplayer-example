//
//  WebPlayer.swift
//  ios-webplayer-example
//
//  Created by Jose Nogueira on 21/10/2022.
//

import Foundation
import OSLog
import WebKit
import AVFoundation

class WebPlayer: WKWebView {
    // MARK: - Life Cycle
    init() {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.mediaTypesRequiringUserActionForPlayback = []
        super.init(frame: .zero, configuration: configuration)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
}

// MARK: - Setup
extension WebPlayer {
    private func setup() {
        navigationDelegate = self
        setupAVAudioSession()
    }
}

// MARK: - Setup AVAudioSession
extension WebPlayer {
    private func setupAVAudioSession() {
        // If your application wants to play another audio, besides the one from the live stream,
        // without stopping the live stream, you should set the `AVAudioSession` options property to `mixWithOthers`
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .spokenAudio, options: .mixWithOthers)
    }
}

// MARK: - Load Web Player
extension WebPlayer {
    func load(streamID: String) {
        os_log("[WebPlayer] Loading livery web player with stream ID [%@]", log: .default, type: .debug, streamID)
        let url = URL(string: "https://embed.liveryvideo.com/?id=\(streamID)")!
        let request = URLRequest(url: url)
        load(request)
    }
}

// MARK: - WKNavigationDelegate
extension WebPlayer: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        os_log("[WebPlayer] didFailProvisionalNavigation with error[%@]", log: .default, type: .debug, error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        os_log("[WebPlayer] didFail with error[%@]", log: .default, type: .debug, error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        os_log("[WebPlayer] didFinish loading", log: .default, type: .debug)
    }
}
