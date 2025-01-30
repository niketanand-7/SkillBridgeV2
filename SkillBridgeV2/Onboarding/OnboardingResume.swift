//
//  OnboardingResume.swift
//  SkillBridgeV2
//
//  Created by Andrew Tran on 1/29/25.
//

import SwiftUI
import UniformTypeIdentifiers

struct OnboardingResume: View {
    @State private var progress: CGFloat = 0.0
    @State private var selectedFileName: String? = nil
    @State private var isDocumentPickerPresented: Bool = false
    
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
            
            // Title: "Resume"
            Text("Resume")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            // File Upload Placeholder
            VStack {
                if let fileName = selectedFileName {
                    Image(systemName: "doc.text.fill")
                        .resizable()
                        .foregroundColor(.blue)
                    
                    Text(fileName)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.top, 5)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .truncationMode(.middle)
                } else {
                    Image(systemName: "doc.text")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                        .foregroundColor(.gray)
                    
                    Text("Add file here")
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 200)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 1, dash: [5]))
            )
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .onTapGesture {
                isDocumentPickerPresented = true  // Show the document picker when tapped
            }
            
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
        .sheet(isPresented: $isDocumentPickerPresented) {
            DocumentPickerView(selectedFileName: $selectedFileName)
        }
    }
}

// Document Picker for selecting files
struct DocumentPickerView: UIViewControllerRepresentable {
    @Binding var selectedFileName: String?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.pdf, UTType.text, UTType.plainText, UTType.data])
        documentPicker.allowsMultipleSelection = false
        documentPicker.delegate = context.coordinator
        return documentPicker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        let parent: DocumentPickerView

        init(_ parent: DocumentPickerView) {
            self.parent = parent
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            if let firstURL = urls.first {
                parent.selectedFileName = firstURL.lastPathComponent  // Display the file name
            }
        }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            // Handle cancelation if needed
        }
    }
}

#Preview {
    OnboardingResume()
}
