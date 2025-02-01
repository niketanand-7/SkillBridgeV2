//
//  OnboardingNumber.swift
//  SkillBridgeV2
//
//  Created by Andrew Tran on 1/29/25.
//

import SwiftUI

struct OnboardingNumber: View {
    @State private var selectedCountryCode: String = "FR +33"
    @State private var phoneNumber: String = ""
    @State private var progress: CGFloat = 0.1
    
    @Environment(\.dismiss) private var dismiss  // Used to handle back navigation
    
    let countryCodes = ["US +1", "FR +33", "UK +44", "IN +91", "DE +49"]
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
            .padding(.top, 10)
            .padding(.top, 55)
            
            // Back Button
            HStack {
                Button(action: {
                    // Handle back action
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
            
            // Title: "My number is"
            Text("My number is")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            // Phone Number Fields
            HStack {
                // Country Code Dropdown
                Menu {
                    ForEach(countryCodes, id: \.self) { code in
                        Button(action: {
                            selectedCountryCode = code
                        }) {
                            Text(code)
                                .foregroundColor(.black)
                        }
                    }
                } label: {
                    HStack(spacing: 4) {
                        Text(selectedCountryCode)
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                        
                        Image(systemName: "triangle.fill")
                            .resizable()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.black)
                            .rotationEffect(.degrees(180)) // Upside-down triangle
                    }
                }
                .frame(maxWidth: 75)
                
                // Phone Number Input
                TextField("Enter your phone number", text: $phoneNumber)
                    .keyboardType(.numberPad)
                    .onChange(of: phoneNumber) { newValue in
                        phoneNumber = formatPhoneNumber(newValue)
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 12)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray),
                        alignment: .bottom
                    )
            }
            .padding(.top, 10)
            .padding(.trailing, 40)
            .padding(.leading, 20)
            
            Spacer()
            
            // Continue Button
            NavigationLink(destination: OnboardingDOB()) {
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
    
    // Function to format phone number
    func formatPhoneNumber(_ number: String) -> String {
        let digits = number.filter { $0.isNumber }
        let maxDigits = 10
        
        // Limit to 10 digits
        if digits.count > maxDigits {
            return String(digits.prefix(maxDigits))
        }
        
        // Format as (XXX) XXX-XXXX
        var formatted = ""
        if digits.count > 0 {
            formatted.append("(")
            formatted.append(contentsOf: digits.prefix(3))
            formatted.append(")")
        }
        if digits.count > 3 {
            formatted.append(" ")
            formatted.append(contentsOf: digits.dropFirst(3).prefix(3))
        }
        if digits.count > 6 {
            formatted.append("-")
            formatted.append(contentsOf: digits.dropFirst(6))
        }
        
        return formatted
    }
}

#Preview {
    OnboardingNumber()
}
