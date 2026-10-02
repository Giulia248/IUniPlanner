//
//  GeneralUtils.swift
//  IUniPlanner
//
//  Created by giulia.floris on 01/10/2026.
//

import Foundation
import SwiftUI
import ProgressHUD

public func getAppVersion() -> String {
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    return appVersion ?? ""
}

public func showLoading() {
    ProgressHUD.animationType = .dualDotSidestep
    ProgressHUD.colorAnimation = Color.darkBlue
        ProgressHUD.colorHUD = .clear
        ProgressHUD.colorBackground = .clear
    ProgressHUD.animate("", interaction: false)
    
}

public func hideLoading() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        ProgressHUD.dismiss()
    }
}

public func uLog(_ string: String) {
    print(string)
    SessionManager.shared.printInfos?.append(string)
}

public var screenSize = UIScreen.main.bounds
public var debug = true

extension Color {
    static let darkBlue = Color(red: 3/255, green: 4/255, blue: 94/255)
    static let simpleBlue = Color(red: 0/255, green: 119/255, blue: 182/255)
    static let lightBlue = Color(red: 173/255, green: 232/255, blue: 244/255).opacity(0.2)
}

