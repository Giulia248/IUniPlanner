//
//  IUniPlannerView.swift
//  IUniPlanner
//
//  Created by giulia.floris on 01/10/2026.
//

import SwiftUI

public struct IUniPlannerView: View {
    @State private var refreshPage = true
    @State private var isLoading = false
    
    public var body: some View {
        ZStack (alignment: .topTrailing){
            topTools
                .opacity(debug ? 1.0 : 0.0)
            VStack {
                if let _ = LocalStorage.shared.user(set: false) {
                    StartView(refreshPage: $refreshPage)
                } else {
                    LoginView()
                }
            }
            .onChange(of: refreshPage, { _ , _ in
                refreshPage.toggle()
            })
        }
        .loading(isLoading)
    }
    
    var topTools: some View{
            HStack {
                
                Button(action: {
                    isLoading = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        isLoading = false
                    })
                }, label: {
                    Image(systemName: "person.badge.clock")
                        .foregroundStyle(Color.gray)
                        .frame(width: 25, height: 25, alignment: .center)
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "text.magnifyingglass")
                        .foregroundStyle(Color.gray)
                        .frame(width: 25, height: 25, alignment: .center)
                })
            }
    
        
    }
}
