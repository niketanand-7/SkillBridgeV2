//
//  OnboardingIdentity.swift
//  SkillBridgeV2
//
//  Created by Andrew Tran on 1/29/25.
//

import SwiftUI

struct OnboardingIdentity: View {
    @State private var progress: CGFloat = 0.0
    @State private var selectedSex: String = "Male"
    @State private var selectedRace: String = "Asian"
    
    let sexes = ["Male", "Female"]
    let races = ["Asian", "Black", "White", "Hispanic", "Other"]
    
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
            
            // Title: "I am a"
            Text("I am a")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            // Sex Selection
            VStack(alignment: .leading, spacing: 10) {
                Text("Sex")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                HStack(spacing: 20) {
                    ForEach(sexes, id: \.self) { sex in
                        Button(action: {
                            selectedSex = sex
                        }) {
                            Text(sex)
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedSex == sex ? Color("SkillBridgeBlue") : Color("SkillBridgeLightBlue"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            // Race Selection
            VStack(alignment: .leading, spacing: 10) {
                Text("Race")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Menu {
                    ForEach(races, id: \.self) { race in
                        Button(action: {
                            selectedRace = race
                        }) {
                            Text(race)
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedRace)
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
    OnboardingIdentity()
}
