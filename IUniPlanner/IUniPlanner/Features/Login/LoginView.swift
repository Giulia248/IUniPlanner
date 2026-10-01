//
//  LoginView.swift
//  IUniPlanner
//
//  Created by giulia.floris on 01/10/2026.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showingSheet = false
    @State var usernameText: String = ""
    @State var bindingValue = true
    var placeholderText: String = LoginStrings.placeholderText.rawValue
    
    private let symbols = [
        "book.pages",
        "book.and.wrench.fill",
        "apple.books.pages",
        "info.circle.text.page",
        "icloud.and.arrow.down",
        "cpu"
    ]
    
    var body: some View {
        
        ZStack {
            
            Color.lightBlue
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .ignoresSafeArea(.all)
                .opacity(showingSheet ? 1.0 : 0.0)
            
            VStack(alignment: .center) {
                
                // top Side
                
                VStack (alignment: .leading) { // top Side
                    
                    RotatingImages(images: symbols)
                    .frame(maxWidth: .infinity, alignment: .center)
                   
                }
               
                // bottom Side
                VStack(alignment: .leading){ // bottom Side
                    Text(LoginStrings.welcome.rawValue)
                    UniTextField(placeholder: placeholderText, text: $usernameText)
                    
                    UniButton(title: LoginStrings.login.rawValue, action: {
                        
                    }, icon: "", isEnabled: $bindingValue)
                    
                    UniButton(title: LoginStrings.info.rawValue, action: {
                        showingSheet.toggle()
                    }, icon: "info.circle", isEnabled: $bindingValue)
                }
            }
            .opacity(showingSheet ? 0.0 : 1.0)
            .sheet(isPresented: $showingSheet) {
                InfoView()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
        }
        
        
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
