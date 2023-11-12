//
//  AnimeLandApp.swift
//  AnimeLand
//
//  Created by 梁非凡 on 2023/11/11.
//

import SwiftUI
import SwiftData
@available(iOS 14.0, *)
@main
struct AnimeLandApp: App {
    var network = Network()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)

        }
    }
}
