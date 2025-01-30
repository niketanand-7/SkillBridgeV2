//
//  OnboardingEmail.swift
//  SkillBridgeV2
//
//  Created by Andrew Tran on 1/30/25.
//

import SwiftUI

struct OnboardingEmail: View {
    @State private var email: String = ""
    @State private var progress: CGFloat = 0.0
    @Environment(\.dismiss) private var dismiss  // Used to navigate back
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
                    dismiss()  // Navigate back to the previous screen
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            // Title: "What's your email?"
            Text("What's your email?")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            // Email Input Field
            TextField("Enter email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(.vertical, 12)
                .padding(.horizontal, 10)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray),
                    alignment: .bottom
                )
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            Spacer()
            
            // Continue Button
            NavigationLink(destination: OnboardingName()) {
                Text("CONTINUE")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("SkillBridgeYellow"))
                    .foregroundColor(.black)
                    .cornerRadius(25)
                    .padding(.horizontal, 20)
            }
            .padding(.bottom, 30)
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden(true)  // Hide the default back button
    }
}

#Preview {
    OnboardingEmail()
}
