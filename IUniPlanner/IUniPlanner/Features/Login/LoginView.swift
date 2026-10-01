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
        ZStack (alignment: .bottomTrailing) {
            
            VStack(alignment: .leading) {
                HStack (alignment: .center) {
                    
                    // left Side
                    VStack(alignment: .leading){ // left Side
                        Text(LoginStrings.welcome.rawValue)
                        UniTextField(placeholder: placeholderText, text: $text)
                        
                        UniButton(title: LoginStrings.login.rawValue, action: {
                            
                        }, icon: "", isEnabled: $bindingValue)
                        
                        UniButton(title: LoginStrings.info.rawValue, action: {
                            
                        }, icon: "info.circle", isEnabled: $bindingValue)
                    }
                    .frame(width: midWidth)
                    
                    Divider()
                    
                    // right Side
                    VStack { // right Side
                        
                        Text(LoginStrings.rightSideDescription.rawValue)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 30)
                        RotatingImages(images: symbols)

                    }
                    .frame(width: midWidth - 50)
                }
            }
            
            Text(LoginStrings.appVersion.rawValue
                .replacingOccurrences(of: "%1", with: getAppVersion()))
            .foregroundStyle(Color.simpleBlue)
            .ignoresSafeArea(.keyboard)
        }
    }
    
    private enum LoginStrings: String {
        case welcome = "Benvenuto su IUniPlanner"
        case placeholderText = "Username"
        case rightSideDescription = "L'università mi sta travolgendo, è ora di creare un'app per pianificare meglio il mio percorso di studi... e questo è tutto."
        case appVersion = "Versione app: %1"
        case info = "Info"
        case login = "Accedi"
    }
}


#Preview {
    LoginView()
}
