//
//  CardView.swift
//  FlashCard
//
//  Created by Qingyang Hu on 2/17/20.
//  Copyright © 2020 Qingyang Hu. All rights reserved.
//

import Foundation
import SwiftUI

struct CardView: View {
    @EnvironmentObject var card: CardData
    @State var dragOffset: CGSize = .zero
    @State var isVisible: Bool = true {
        didSet {
            if !self.isVisible {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.card.next()
                    self.dragOffset = .zero
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.isVisible = true
                    }
                }
            }
        }
    }
    
    var body: some View {
        VStack {
             WordView()
                .environmentObject(self.card)
                .onTapGesture {
                    self.card.showBackSide.toggle()
                }
                .offset(self.dragOffset)
                .opacity(self.isVisible ? 1.0: 0.0)
                .animation(Animation.linear(duration: 0.1))
                .gesture(
                    DragGesture().onChanged({ (value) in
                        self.dragOffset = value.translation
                    }).onEnded({ (value) in
                        if (abs(value.predictedEndTranslation.width) > 400) {
                            self.dragOffset = value.predictedEndTranslation
                            self.isVisible.toggle()
                        } else {
                            self.dragOffset = .zero
                        }
                        
                    })
                )
                .padding(40.0)
            NavigationLink(destination: WordListView()) {
                Text("Check Full List")
            }
        }
        .navigationBarHidden(true)
    }
}
