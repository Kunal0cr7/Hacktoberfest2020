//
//  LottieView.swift
//  SafeText
//
//  Created by Shaurya Gupta on 2022-09-21.
//

import SwiftUI
import Lottie

struct LottieAnimationView: UIViewRepresentable {
    var animationName: String
    var loopMode = LottieLoopMode.playOnce

    func makeUIView(context: UIViewRepresentableContext<LottieAnimationView>) -> UIView {
        let view = UIView(frame: .zero)

        if animationName.isEmpty {
            fatalError("animationName can not be empty")
        }

        let animatedView = AnimationView()
        let animation = Animation.named(animationName)
        animatedView.animation = animation
        animatedView.contentMode = .scaleAspectFit
        animatedView.loopMode = loopMode
        animatedView.play()

        animatedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animatedView)
        NSLayoutConstraint.activate([
            animatedView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animatedView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
