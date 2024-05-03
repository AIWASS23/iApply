//
//  MainView.swift
//  iApply
//
//  Created by Marcelo de Araujo on 02/05/2024.
//

import SwiftUI

struct MainView: View {
    
    @State var showIntro: Bool = true
    
    var body: some View {
        NavigationStack{
            if showIntro {
                IntroView(showIntro: $showIntro)
            } else {
                DashboardView()
            }
        }
        .fontDesign(.rounded)
        .tint(.primary)
        
        .onAppear(){
            if UserDefaults.standard.bool(forKey: "hasShownIntro") == false {
                print(UserDefaults.standard.bool(forKey: "hasShownIntro"))
                self.showIntro = false
            } else {
                self.showIntro = true
            }
        }
    }
}

