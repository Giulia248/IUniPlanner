//
//  InfoView.swift
//  IUniPlanner
//
//  Created by giulia.floris on 01/10/2026.
//

import SwiftUI
internal import Combine

struct InfoView: View {

    private let packages = ["SwiftUi",
    ]
    
    var body: some View {
        ZStack {
            RotatingImages(images: ["info", "info", "info", "info"])
            VStack (alignment: .leading){
                VStack (alignment: .leading, spacing: 20){
                    Text(InfoStrings.welcome.rawValue)
                        .foregroundStyle(Color.darkBlue)
                    Text(InfoStrings.description.rawValue)
                    
                    VStack(alignment: .leading) {
                        Text(InfoStrings.sdkUsed.rawValue)
                        
                        ForEach(packages, id: \.self){ content in
                            Text("- \(content)")
                                .padding(.horizontal, 12)
                        }
                        Text(InfoStrings.appVersion.rawValue
                            .replacingOccurrences(of: "%1", with: getAppVersion()))
                    }
                    .padding(.vertical, 8)
                    
                }
            }
        }
        .padding(8)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)

    }
    
    private enum InfoStrings: String {
        case welcome = "Benvenuto su IUniPlanner"
        case description = "L'università mi sta travolgendo, è ora di creare un'app per pianificare meglio il mio percorso di studi... e questo è tutto."
        case appVersion = "Versione app: %1"
        case sdkUsed = "Pacchetti e Framework utilizzati:"
        
    }
}

#Preview {
    InfoView()
}
