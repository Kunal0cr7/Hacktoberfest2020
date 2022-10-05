//
//  Authentication.swift
//  SafeText
//
//  Created by Shaurya Gupta on 2022-09-25.
//

import LocalAuthentication
import SwiftUI

struct Authentication {
    @Binding var isUnlocked: Bool
    func Authenticate() {
        let localAuthenticationContext = LAContext()
        localAuthenticationContext.localizedFallbackTitle = "Please use your Passcode"
        
        var authorizationError: NSError?
        let reason = "Authentication is required to continue."
        if localAuthenticationContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthentication, error: &authorizationError) {
            
            localAuthenticationContext.evaluatePolicy(LAPolicy.deviceOwnerAuthentication, localizedReason: reason) { (success, evaluationError) in
                if success {
                    // Set isUnlocked to true so that we can switch screens
                    print("Success!")
                    isUnlocked = true
                    
                } else {
                    // Error
                    print("Error \(evaluationError!.localizedDescription)")
                }
            }
            
        } else {
            // No biometrics
            print("User has not enrolled into using Biometrics")
        }
    }
}
