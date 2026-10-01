//
//  LoginView.swift
//  IUniPlanner
//
//  Created by giulia.floris on 01/10/2026.
//

import SwiftUI

struct LoginView: View {
    
    @State var text: String = ""
    @State var bindingValue = true
    var placeholderText: String = LoginStrings.placeholderText.rawValue
    
    private let symbols = [
        "book.pages",
        "book.and.wrench.fill",
        "apple.books.pages",
        "cpu"
    ]
    private let midWidth = UIScreen.main.bounds.width / 2
    
    var body: some View {
            
            VStack(alignment: .center) {
                    
                // top Side
                
                VStack (alignment: .leading) { // top Side
                    
                    HStack {
                        Spacer()
                        RotatingImages(images: symbols)
                        Spacer()
                    }
                }
//                .frame(width: midWidth - 50)
                
                    // bottom Side
                    VStack(alignment: .leading){ // bottom Side
                        Text(LoginStrings.welcome.rawValue)
                        UniTextField(placeholder: placeholderText, text: $text)
                        
                        UniButton(title: LoginStrings.login.rawValue, action: {
                            
                        }, icon: "", isEnabled: $bindingValue)
                        
                        UniButton(title: LoginStrings.info.rawValue, action: {
                            
                        }, icon: "info.circle", isEnabled: $bindingValue)
                    }
//                    .frame(width: midWidth)
                    
            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .ignoresSafeArea()
    }
    
    private enum LoginStrings: String {
        case welcome = "Benvenuto su IUniPlanner"
        case placeholderText = "Username"
        case appVersion = "Versione app: %1"
        case info = "Info"
        case login = "Accedi"
    }
}


#Preview {
    LoginView()
}
