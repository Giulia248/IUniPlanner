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
            do {
                let data = try JSONEncoder().encode(user)
                defaults.set(data, forKey: "userKey")
                return nil
            } catch {
                print("Failed to save user: \(error)")
                return nil
            }
        } else {
            
            if let data = defaults.data(forKey: "userKey") {
                do {
                    let user = try JSONDecoder().decode(
                        UserModel.self,
                        from: data
                    )
                    return user
                } catch {
                    return nil
                }
            } else {
                return nil
            }

        }
    }

    private init() { }
}
