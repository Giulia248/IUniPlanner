//
//  HomeCell.swift
//  IUniPlanner
//
//  Created by giulia.floris on 05/10/2026.
//

import SwiftUI

struct HomeCell: View {
    var type: HomeCellType
    var body: some View {
        ZStack {
            VStack {
                
                switch type {
                    
                case .exams:
                    Text(HomeCell.exams.rawValue)
                case .myNotes:
                    VStack {
                        Text(HomeCell.myNotes.rawValue)
                    }
                case .news:
                    Text(HomeCell.myNotes.rawValue)
                }
            }
            .padding(16)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.blue, lineWidth: 0.5)
            )
        }
    }
    private enum HomeCell: String {
        case myNotes = "Le mie note"
        case exams = "Esami registrati e appelli successivi"
        case news = "News"
    }
}

internal enum HomeCellType {
    case myNotes
    case exams
    case news
}

#Preview {
    HomeCell(type: .myNotes)
}
