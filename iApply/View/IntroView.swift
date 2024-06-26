//
//  IntroView.swift
//  iApply
//
//  Created by Marcelo de Araujo on 02/05/2024.
//

import SwiftUI

struct IntroView: View {
    
    // MARK: - Properties
    
    @Binding var showIntro: Bool
    
    // MARK: - Body
    
    var body: some View {
        VStack{
            Spacer()
            Image("intro")
                .resizable()
                .scaledToFit()
                .padding(50)
            Spacer()
            VStack{
                Text("Welcome to iApply")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 15)
                
                Text("iApply assists you in staying organized and conveniently tracking your job applications.")
                    .multilineTextAlignment(.center)
                    .fontDesign(.rounded)
                    .foregroundStyle(.secondary)
            }
            .padding()
            
            Button(action: {
                // Update UserDefaults flag
                UserDefaults.standard.set(false, forKey: "hasShownIntro")
                // Update showIntro to false
                self.showIntro = false
            }, label: {
                Text("Get Started")
                    .frame(width: 200, height: 50, alignment: .center)
                    .background(Color(.customYellow))
                    .clipShape(Capsule())
                    .foregroundColor(.black)
                    .font(.headline)
            })
            
            Spacer()
        }
    }
}

// MARK: - Preview IntroView

#if DEBUG
#Preview {
    IntroView(showIntro: .constant(true))
}
#endif
