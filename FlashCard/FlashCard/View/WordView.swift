//
//  WordView.swift
//  FlashCard
//
//  Created by Qingyang Hu on 2/17/20.
//  Copyright © 2020 Qingyang Hu. All rights reserved.
//

import Foundation
import SwiftUI

struct WordView: View {
    @EnvironmentObject var card: CardData
    
    var body: some View {
        VStack {
            if !card.isCompleted {
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(!card.showBackSide ? Color.blue: Color.green, lineWidth: 5)
                    .frame(width: 300, height: 200)
                    .overlay(
                         Text(!card.showDefinition ? card.word: card.definition)
                            .font(Font.system(size: 40, design: .default))
                            .rotation3DEffect(!self.card.showDefinition ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(20), z: CGFloat(0)))
                            .animation(.none)
                    )
                    .rotation3DEffect(!self.card.showBackSide ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(20), z: CGFloat(0)))
                    .animation(.default)
                    .padding(40.0)
            } else {
                Text("Completed!")
                    .font(.title)
                    .padding()
                Button(action: {
                    self.card.isCompleted = false
                }) {
                    Text("Try Again")
                }
            }
            
            
        }
        
            
        
    }
}
