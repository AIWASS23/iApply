//
//  iApplyApp.swift
//  iApply
//
//  Created by Marcelo de Araujo on 30/04/2024.
//

import SwiftUI

@main
struct iApplyApp: App {
    
    let dataController = DataController.shared
    @Environment(\.scenePhase) private var scenePhase
    
    init() {
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor.label
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext,dataController.container.viewContext)
                .onChange(of: scenePhase) { _, newValue in
                    switch newValue {
                    case .background, .inactive:
                        // Call your save action here
                        DataController.shared.save()
                    default:
                        break
                    }
                }
        }
    }
}
