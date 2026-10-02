//
//  SessionManager.swift
//  IUniPlanner
//
//  Created by giulia.floris on 01/10/2026.
//

import Foundation

class SessionManager {
    
    static let shared = SessionManager()
    
    private init() { }
    
    public var printInfos: [String]? = ["--"]
    
    
    public func eraseAllInfo() {
        printInfos = ["--"]
    }
}
