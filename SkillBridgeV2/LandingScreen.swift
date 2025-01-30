//
//  LandingScreen.swift
//  SkillBridgeV2
//
//  Created by Andrew Tran on 1/29/25.
//

import SwiftUI

struct LandingScreen: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                Color("SkillBridgeBlue")
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    // App Title
                    Text("SkillBridge")
                        .font(.system(size: 50))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // Create Account Button
                    NavigationLink(destination: OnboardingEmail()) {
                        Text("CREATE ACCOUNT")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("SkillBridgeYellow"))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                            .padding(.horizontal, 40)
                    }
                    .padding(.bottom, 10)
                    
                    // Sign In Button
                    Button(action: {
                        // Handle Sign In action
                    }) {
                        Text("SIGN IN")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color("SkillBridgeYellow"), lineWidth: 2)
                            )
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                    }
                    
                    Spacer().frame(height: 50)
                }
            }
        }
    }
}

#Preview {
    LandingScreen()
}
