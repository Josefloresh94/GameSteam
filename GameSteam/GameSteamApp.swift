//
//  GameSteamApp.swift
//  GameSteam
//
//  Created by José Flores on 17/10/21.
//

import SwiftUI

@main
struct GameSteamApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) {phase in
            
        }
    }
}
