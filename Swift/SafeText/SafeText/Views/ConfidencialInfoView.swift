//
//  SecretStuff.swift
//  SafeText
//
//  Created by Shaurya Gupta on 2022-09-25.
//

import SwiftUI

struct ConfidencialInfoView: View {
    @Binding var isUnlocked: Bool
    @Binding var needAuth: Bool
    @Binding var presentAlert: Bool
    @Binding var confidencialInfo: String
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Your text goes here:")
                    .foregroundColor(.black.opacity(0.7))
                    .padding(.bottom, -40)
                    .padding(.leading, -130)
                
                TextEditor(text: $confidencialInfo)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .padding(.leading, 5)
                    .frame(height: 400)
                    .border(LinearGradient(colors: [.yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing), width: 2)
                    .padding()
                    .autocorrectionDisabled(false)
                    .textInputAutocapitalization(.never)
                    .foregroundColor(.black)
                Button {
                    // Save Data
                    UserDefaults.standard.set(confidencialInfo, forKey: "info")
                    presentAlert = true
                } label: {
                    HStack {
                        Text("Save")
                            .foregroundColor(.white)
                    }
                }
                .alert(isPresented: $presentAlert, content: {
                    Alert(title: Text("Saved Successfully!"), dismissButton: .default(Text("OK"), action: {
                        isUnlocked = false
                    }))
                })
                .font(.title3)
                .padding(.horizontal, 160)
                .padding(.vertical, 10)
                .background(.blue)
                .cornerRadius(5)
                
                Toggle("Ask for biometry next time?", isOn: $needAuth)
                    .padding(.horizontal, 70)
                    .padding(.top, 15)
                    .font(.headline)
                    .fontWeight(.medium)
            }
        }
        .background(.blue)
        .scrollContentBackground(.hidden)
        .navigationTitle("SafeText")
        .preferredColorScheme(.light)
        .toolbarColorScheme(.light, for: .navigationBar)
    }
}
