//
//  QR_ScannerApp.swift
//  QR Scanner
//
//  Created by 구리뽕 on 12/20/24.
//

import Quartz
import SwiftUI

@main
struct QR_ScannerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
//        .defaultSize(width: 1000, height: 600)
        .windowResizability(.contentSize)
    }
}
