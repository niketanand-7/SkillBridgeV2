import Foundation

class UserOnboardingModel: ObservableObject {
    // User information
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var phoneNumber: String = ""
    @Published var dateOfBirth: Date = Date()
    @Published var address: String = ""
    @Published var education: String = ""
    @Published var employment: String = ""
    @Published var identityVerification: String = ""
    @Published var resumeURL: String = ""
    @Published var hasConsented: Bool = false
    
    // Validation states
    @Published var emailError: String? = nil
    @Published var passwordError: String? = nil
    @Published var phoneError: String? = nil
    
    // Validation functions
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        let isValid = emailPredicate.evaluate(with: email)
        emailError = isValid ? nil : "Please enter a valid email address"
        return isValid
    }
    
    func validatePassword() -> Bool {
        let isValid = password.count >= 8
        passwordError = isValid ? nil : "Password must be at least 8 characters"
        return isValid
    }
    
    func validatePhone() -> Bool {
        let phoneRegex = "^\\d{10}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        let isValid = phonePredicate.evaluate(with: phoneNumber)
        phoneError = isValid ? nil : "Please enter a valid 10-digit phone number"
        return isValid
    }
    
    // Create user in database
    func createUser() async throws {
        guard validateEmail() else { throw ValidationError.invalidEmail }
        guard validatePassword() else { throw ValidationError.invalidPassword }
        guard validatePhone() else { throw ValidationError.invalidPhone }
        
        // Here you'll integrate with your AuthManager to create the user
        // and store additional information in your database
        
        // Example:
        // try await AuthManager.shared.signUp(email: email, password: password)
        // Then store additional user information in your database
    }
}

// Custom errors for validation
enum ValidationError: Error {
    case invalidEmail
    case invalidPassword
    case invalidPhone
}

