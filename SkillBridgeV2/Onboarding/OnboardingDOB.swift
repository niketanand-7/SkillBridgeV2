//
//  OnboardingDOB.swift
//  SkillBridgeV2
//
//  Created by Andrew Tran on 1/29/25.
//

import SwiftUI

struct OnboardingDOB: View {
    @State private var day: String = ""
    @State private var month: String = ""
    @State private var year: String = ""
    @State private var progress: CGFloat = 0.2
    
    @Environment(\.dismiss) private var dismiss  // Used to handle back navigation
    
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
            
            // Title: "My birthday is"
            Text("My birthday is")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            // Date Input Fields
            HStack(spacing: 10) {
                // Day Field
                TextField("DD", text: $day)
                    .font(.system(size: 24))
                    .frame(width: 80)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .keyboardType(.numberPad)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray),
                        alignment: .bottom
                    )
                    .onChange(of: day) { newValue in
                        if newValue.count > 2 {
                            day = String(newValue.prefix(2))
                        }
                    }
                
                // Slash separator
                Text("/")
                    .foregroundColor(.gray)
                
                // Month Field
                TextField("MM", text: $month)
                    .font(.system(size: 24))
                    .frame(width: 80)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .keyboardType(.numberPad)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray),
                        alignment: .bottom
                    )
                    .onChange(of: month) { newValue in
                        if newValue.count > 2 {
                            month = String(newValue.prefix(2))
                        }
                    }
                
                // Slash separator
                Text("/")
                    .foregroundColor(.gray)
                
                // Year Field
                TextField("YYYY", text: $year)
                    .font(.system(size: 24))
                    .frame(width: 120)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .keyboardType(.numberPad)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray),
                        alignment: .bottom
                    )
                    .onChange(of: year) { newValue in
                        if newValue.count > 4 {
                            year = String(newValue.prefix(4))
                        }
                    }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Spacer()
            
            // Continue Button
            NavigationLink(destination: OnboardingIdentity()) {
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
    OnboardingDOB()
}
