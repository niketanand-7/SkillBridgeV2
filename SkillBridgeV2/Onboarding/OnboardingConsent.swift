//
//  OnboardingConsent.swift
//  SkillBridgeV2
//
//  Created by Andrew Tran on 1/30/25.
//

import SwiftUI

struct OnboardingConsent: View {
    @State private var progress: CGFloat = 1.0
    @State private var isAgreed: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            // Progress Bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Color.gray.opacity(0.2)
                        .frame(height: 5)
                    
                    Color("SkillBridgeYellow")
                        .frame(width: progress * geometry.size.width, height: 5)
                        .animation(.easeInOut(duration: 0.3), value: progress)
                }
            }
            .frame(height: 5)
            .padding(.top, 55)
            
            // Back Button
            HStack {
                Button(action: {
                    // Add back navigation functionality here
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            // Title: "Consent"
            Text("Consent")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            // Consent Description
            Text("""
                    By selecting “I Agree,” you authorize SkillBridge to use the information you have provided (such as your resume, cover letter, and other relevant details) to apply to job postings on your behalf. You understand that this authorization includes sharing your information with third-party employers and job platforms.
                    
                    You can revoke your consent at any time by adjusting your settings within the app or contacting support.
                    """)
            .font(.body)
            .foregroundColor(.black)
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            // Checkbox for Agreement
            HStack {
                Button(action: {
                    isAgreed.toggle()  // Toggle agreement state
                }) {
                    HStack {
                        Image(systemName: isAgreed ? "checkmark.square" : "square")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                        Text("I Agree")
                            .foregroundColor(.black)
                            .font(.body)
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Spacer()
            
            // Continue Button
            Button(action: {
                if isAgreed, progress < 1.0 {
                    progress += 0.1
                }
            }) {
                Text("CONTINUE")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isAgreed ? Color("SkillBridgeYellow") : Color.gray.opacity(0.5))
                    .foregroundColor(.black)
                    .cornerRadius(25)
                    .padding(.horizontal, 20)
            }
            .padding(.bottom, 30)
            .disabled(!isAgreed)  // Disable button if not agreed
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden(true)  // Hide the default back button
    }
}

#Preview {
    OnboardingConsent()
}
