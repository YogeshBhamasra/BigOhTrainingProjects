//
//  FirebaseManager.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 01/03/23.
//

import UIKit
import Firebase

class FirebaseManager {
    static let shared = FirebaseManager()
    static let remoteConfig = RemoteConfig.remoteConfig()
    
    private init() {}
    
    func configFirebase() {
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        FirebaseManager.remoteConfig.configSettings = settings
        FirebaseManager.remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
    }
}
