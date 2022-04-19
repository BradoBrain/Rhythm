//
//  RhythmApp.swift
//  Shared
//
//  Created by Artem Vinogradov on 10.04.2022.
//

import SwiftUI

@main
struct RhythmApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            ContentView(beatValue: 100)
                .frame(width: 600, height: 600, alignment: .center)
            #else
            ContentView(beatValue: 100)
            #endif
        }
    }
}
