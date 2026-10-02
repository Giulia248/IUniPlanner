//
//  StartView.swift
//  IUniPlanner
//
//  Created by giulia.floris on 01/10/2026.
//

import SwiftUI

struct StartView: View {
    
    @State private var showingSheet = false
    @State var usernameText: String = ""
    @State var loginBindingValue = true
    @State var infoBindingValue = true
    
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
                    Text(StartView.welcome.rawValue)
                    
                    Text(self.usernameText)
                    
                    UniButton(title: StartView.login.rawValue, action: {
                        
                    }, icon: "", isEnabled: $loginBindingValue)
                    
                    UniButton(title: StartView.info.rawValue, action: {
                        showingSheet.toggle()
                    }, icon: "info.circle", isEnabled: $infoBindingValue)
                }
            }
            .opacity(showingSheet ? 0.0 : 1.0)
            .sheet(isPresented: $showingSheet) {
                InfoView()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
        }
        .onAppear {
            if let username = LocalStorage.shared.user(set: false)  {
                self.usernameText = username.name ?? StartView.error1.rawValue
            } else {
                self.usernameText = StartView.error1.rawValue
            }
            
        }
    }
    
    private enum StartView: String {
        case welcome = "Benvenuto su IUniPlanner"
        case error1 = "errore nel recuperare l'user"
        case info = "Info"
        case login = "Inizia"
    }
}


#Preview {
    StartView()
}
