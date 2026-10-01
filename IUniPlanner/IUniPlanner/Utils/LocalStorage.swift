//
//  LocalStorage.swift
//  IUniPlanner
//
//  Created by giulia.floris on 01/10/2026.
//

import Foundation

class LocalStorage {
    static let shared = LocalStorage()
    
    private let userKey = "userKey"
    private let defaults = UserDefaults.standard

    internal func user(set: Bool, user: UserModel? = nil)  -> UserModel? {
//        showLoading()
        if set {
            guard let user = user else { return nil }
            defaults.set(user, forKey: userKey)
//            hideLoading()
            return nil
        } else {
            let user = defaults.object(forKey: userKey) as? UserModel ?? UserModel()
//            hideLoading()
            return user
        }
    }

    private init() { }
}
