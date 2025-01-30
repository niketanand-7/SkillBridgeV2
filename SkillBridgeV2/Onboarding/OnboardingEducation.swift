//
//  OnboardingEducation.swift
//  SkillBridgeV2
//
//  Created by Andrew Tran on 1/30/25.
//

import SwiftUI

struct OnboardingEducation: View {
    @State private var progress: CGFloat = 0.9
    @State private var education: String = ""
    @State private var certifications: String = ""
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
            
            // Title: "Education"
            Text("Education")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            // Education Field
            VStack(alignment: .leading, spacing: 10) {
                Text("Education")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 20)
                
                TextField("i.e. University of Virginia", text: $education)
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 20)
            }
            .padding(.top, 20)
            
            // Licenses/Certifications Field
            VStack(alignment: .leading, spacing: 10) {
                Text("Licenses / Certifications")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 20)
                
                TextEditor(text: $certifications)
                    .padding()
                    .frame(height: 120)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 20)
            }
            .padding(.top, 20)
            
            Spacer()
            
            // Continue Button
            NavigationLink(destination: OnboardingConsent()) {
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
    OnboardingEducation()
}
