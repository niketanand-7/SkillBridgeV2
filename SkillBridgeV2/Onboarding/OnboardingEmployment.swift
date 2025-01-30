//
//  OnboardingEmployment.swift
//  SkillBridgeV2
//
//  Created by Andrew Tran on 1/30/25.
//

import SwiftUI

struct OnboardingEmployment: View {
    @State private var progress: CGFloat = 0.8
    
    // Example data structure for employment entries
    @State private var employmentEntries: [EmploymentEntry] = Array(repeating: EmploymentEntry(company: "", reasonForLeaving: ""), count: 3)
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
            
            // Title: "Employment"
            Text("Employment")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            // Scrollable Employment Input Fields
            ScrollView {
                ForEach(0..<employmentEntries.count, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 10) {
                        // Company Title and Field
                        Text("Company")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 20)
                        
                        TextField("Clark Construction Group", text: $employmentEntries[index].company)
                            .padding()
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .padding(.horizontal, 20)
                        
                        // Reason for Leaving Title and Field
                        Text("Reason for leaving")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 20)
                        
                        TextField("N/A", text: $employmentEntries[index].reasonForLeaving)
                            .padding()
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .padding(.horizontal, 20)
                    }
                    .padding(.top, 20)
                }
            }
            .padding(.top, 10)
            
            Spacer()
            
            // Continue Button
            NavigationLink(destination: OnboardingEducation()) {
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

struct EmploymentEntry {
    var company: String
    var reasonForLeaving: String
}

#Preview {
    OnboardingEmployment()
}
