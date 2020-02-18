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
            if !card.isCompleted {
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
                    .padding(60.0)
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray)
                        .frame(width: 310, height: 20)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.blue)
                        .frame(width: CGFloat(310.0 * card.percentage), height: 20.0)
                        .animation(.easeInOut)
                }
                    .padding(10.0)
                NavigationLink(destination: WordListView().environmentObject(self.card)) {
                    Text("Check Full List")
                }
            } else {
                Text("Completed!")
                   .font(.title)
                   .padding()
                Button(action: {
                    self.card.isCompleted = false
                }) {
                    Text("Practice Again")
                }
            }
        }
        .navigationBarTitle(Text(card.name), displayMode: .inline)
    }
}
