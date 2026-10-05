//
//  HomeView.swift
//  IUniPlanner
//
//  Created by giulia.floris on 05/10/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.lightBlue
                .ignoresSafeArea(.all)
            
            VStack {
                Text(HomeView.welcome.rawValue)
                
            }
        }
    }
    
    
    
    
    private enum HomeView: String {
        case welcome = "Benvenuto su IUniPlanner"
        case select = "Seleziona la sezione interessata"
    }
}

#Preview {
    HomeView()
}
