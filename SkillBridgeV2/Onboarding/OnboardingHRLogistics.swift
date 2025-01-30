//
//  OnboardingHRLogistics.swift
//  SkillBridgeV2
//
//  Created by Andrew Tran on 1/29/25.
//

import SwiftUI

struct OnboardingHRLogistics: View {
    @State private var progress: CGFloat = 0.0
    @State private var selectedVeteranStatus: String = "Protected Veteran"
    
    let veteranStatuses = ["Protected Veteran", "Not a Veteran", "Prefer not to say"]
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
            
            // Title: "HR / Logistics"
            Text("HR / Logistics")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            // Veteran Status Dropdown
            VStack(alignment: .leading, spacing: 10) {
                Text("Veteran Status")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Menu {
                    ForEach(veteranStatuses, id: \.self) { status in
                        Button(action: {
                            selectedVeteranStatus = status
                        }) {
                            Text(status)
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedVeteranStatus)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            // Additional Info Links
            VStack(alignment: .leading, spacing: 15) {
                infoLink(title: "Disability Info")
                infoLink(title: "Work Authorization")
                infoLink(title: "Criminal Record")
                infoLink(title: "Immigration Status")
                infoLink(title: "Selective Service Requirement")
            }
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
    
    // Helper function for info links
        @ViewBuilder
        private func infoLink(title: String) -> some View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.gray)
                Button(action: {
                    // Handle link action here
                }) {
                    Text("(Click here to read)")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .underline()
                }
            }
        }
}

#Preview {
    OnboardingHRLogistics()
}
