//
//  ContentView.swift
//  SafeText
//
//  Created by Shaurya Gupta on 2022-09-21.
//

import SwiftUI
import Lottie
import LocalAuthentication

struct ContentView: View {
    @State private var isUnlocked = true
    @AppStorage("info") private var confidencialInfo = ""
    @AppStorage("needAuth") private var needAuth = true
    @State private var presentAlert = false
    var body: some View {
        ZStack {
            Color(UIColor(red: 1.00, green: 0.98, blue: 0.90, alpha: 1.00))
                .ignoresSafeArea()
            
            if isUnlocked == false && needAuth == true {
                withAnimation(.easeInOut) {
                    HomepageView(isUnlocked: $isUnlocked)
                }
            } else {
                withAnimation(.easeInOut) {
                    ConfidencialInfoView(isUnlocked: $isUnlocked, needAuth: $needAuth, presentAlert: $presentAlert, confidencialInfo: $confidencialInfo)
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
