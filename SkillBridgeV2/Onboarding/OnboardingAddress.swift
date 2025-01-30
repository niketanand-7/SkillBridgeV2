//
//  OnboardingAddress.swift
//  SkillBridgeV2
//
//  Created by Andrew Tran on 1/29/25.
//

import SwiftUI

struct OnboardingAddress: View {
    @State private var progress: CGFloat = 0.0
    @State private var address: String = ""
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
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            // Title: "My address is"
            Text("My address is")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            // Address Input Field
            TextField("1234 Cherry St, Appletown, VA", text: $address)
                .padding(.vertical, 12)
                .padding(.horizontal, 10)
                .background(Color.white)
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
            Button(action: {
                if progress < 1.0 {
                    progress += 0.1
                }
            }) {
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
    }
}

#Preview {
    OnboardingAddress()
}
