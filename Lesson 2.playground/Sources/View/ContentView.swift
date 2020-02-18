//
//  ContentView.swift
//  FlashCard
//
//  Created by Qingyang Hu on 2/17/20.
//  Copyright © 2020 Qingyang Hu. All rights reserved.
//

import SwiftUI

public struct ContentView: View {
    @EnvironmentObject var card: CardData
    
    public init() {
    }
    
    public var body: some View {
        NavigationView {
            CardView().environmentObject(self.card)
        }
        
    }
}
