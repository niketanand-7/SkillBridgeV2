import SwiftUI

struct OnboardingName: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var progress: CGFloat = 0.1
    
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
            
            // Title: "My name is"
            Text("My name is")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            // Name Fields
            VStack(spacing: 20) {
                TextField("First name", text: $firstName)
                    .padding(.vertical, 12)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray),
                        alignment: .bottom
                    )
                
                TextField("Last name", text: $lastName)
                    .padding(.vertical, 12)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray),
                        alignment: .bottom
                    )
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            // Instruction Text
            Text("This is how it will appear in SkillBridge, and you will not be able to change it.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            
            Spacer()
            
            // Continue Button
            NavigationLink(destination: OnboardingNumber()) {
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
    OnboardingName()
}
