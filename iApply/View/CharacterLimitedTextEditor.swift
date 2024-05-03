//
//  CharacterLimitedTextEditor.swift
//  iApply
//
//  Created by Marcelo de Araujo on 02/05/2024.
//

import SwiftUI

struct CharacterLimitedTextEditor: View {
    
    // MARK: - Properties
    
    @Binding var text: String
    let characterLimit: Int
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            VStack {
                TextEditor(text: $text)
                    .onChange(of: text, { _ , newValue in
                        if newValue.count > characterLimit {
                            text = String(newValue.prefix(characterLimit))
                        }
                    })
            }
            .frame(height: 200)
            
            VStack {
                if text.isEmpty {
                    HStack {
                        Text("Add your note here...")
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    .padding(.top,5)
                }
                Spacer()
                HStack {
                    Spacer()
                    Text("\(text.count) / \(characterLimit)")
                        .foregroundColor(.secondary)
                }
            }
            .frame(height: 200)
        }
    }
}

//#Preview {
//    CharacterLimitedTextEditor()
//}
