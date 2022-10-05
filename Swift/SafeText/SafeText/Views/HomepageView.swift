//
//  Homepage.swift
//  SafeText
//
//  Created by Shaurya Gupta on 2022-09-25.
//

import SwiftUI

struct HomepageView: View {
    @Binding var isUnlocked: Bool
    var body: some View {
        NavigationStack {
            // MARK: Title
            VStack(alignment: .leading) {
                Text("Welcome,")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.5))
                Text("Authenticate to begin")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.8))
                    .padding(.top, -25)
            }
            LottieAnimationView(animationName: "secure", loopMode: .loop)
                .frame(width: 400, height: 400)
            Button {
                // MARK: Authenticate User
                Authentication(isUnlocked: $isUnlocked).Authenticate()
            } label: {
                // MARK: Auth button label
                Text("Authenticate")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.horizontal, 100)
                    .padding(.vertical, 10)
            }
            .background(.blue)
            .cornerRadius(5)
        }
        .background(.blue)
        .scrollContentBackground(.hidden)
        .preferredColorScheme(.light)
        .toolbarColorScheme(.light, for: .navigationBar)
    }
}
