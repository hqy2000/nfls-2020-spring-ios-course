//
//  WordListView.swift
//  FlashCard
//
//  Created by Qingyang Hu on 2/17/20.
//  Copyright © 2020 Qingyang Hu. All rights reserved.
//

import Foundation
import SwiftUI

struct WordRow: View {
    let word: Word
    var body: some View {
        HStack {
            Text(word.word)
                .font(.headline)
            Spacer()
            Text(word.defintion)
                .font(.subheadline)
        }
    }
}
