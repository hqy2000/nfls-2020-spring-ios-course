//
//  WordListView.swift
//  FlashCard
//
//  Created by Qingyang Hu on 2/17/20.
//  Copyright © 2020 Qingyang Hu. All rights reserved.
//

import Foundation
import SwiftUI

struct WordListView: View {
    var body: some View {
        List(words, id: \.id) { word in
            WordRow(word: word)
        }
        .navigationBarTitle(name)
    }
}
