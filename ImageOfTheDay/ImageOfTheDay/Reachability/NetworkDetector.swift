//
//  NetworkDetector.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 21/06/22.
//

import Foundation

class NetworkDetector: NSObject {

    var reachability: Reachability?
    
    static let shared: NetworkDetector = { return NetworkDetector() }()
    
    override init() {
        super.init()

        reachability = Reachability()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )
        
        do {
            try reachability?.startNotifier()
        } catch {
        }
    }
    
    @objc func networkStatusChanged(_ notification: Notification) {
        // Do something globally here!
    }
    
    static func stopNotifier() -> Void {
        do {
            try (NetworkDetector.shared.reachability)?.startNotifier()
        } catch {
        }
    }

    static func isReachable() -> Bool {
        if  (NetworkDetector.shared.reachability)?.connection == .cellular ||
            (NetworkDetector.shared.reachability)?.connection == .wifi
        {
            return true
        } else {
            return false
        }
    }
}
