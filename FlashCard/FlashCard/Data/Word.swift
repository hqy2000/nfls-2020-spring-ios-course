//
//  Word.swift
//  FlashCard
//
//  Created by Qingyang Hu on 2/17/20.
//  Copyright © 2020 Qingyang Hu. All rights reserved.
//

import Foundation
import SwiftUI

struct Word {
    let id: Int
    let word: String
    let defintion: String
}

let words = [
    Word(id: 0, word: "寝る", defintion: "to sleep"),
    Word(id: 1, word: "する", defintion: "to do"),
    Word(id: 2, word: "食べる", defintion: "to eat"),
    Word(id: 3, word: "行く", defintion: "to go"),
    Word(id: 4, word: "聞く", defintion: "to listen"),
    Word(id: 5, word: "帰る", defintion: "to come"),
    Word(id: 6, word: "飲む", defintion: "to drink"),
    Word(id: 7, word: "読む", defintion: "to read"),
    Word(id: 8, word: "起きる", defintion: "to get up"),
    Word(id: 9, word: "食べる", defintion: "to eat"),
    Word(id: 10, word: "浴びる", defintion: "to take a bath"),
    Word(id: 11, word: "会う", defintion: "to meet"),
    Word(id: 12, word: "大きい", defintion: "big"),
    Word(id: 13, word: "小さい", defintion: "small"),
    Word(id: 14, word: "多い", defintion: "many"),
    Word(id: 15, word: "少ない", defintion: "few"),
    Word(id: 16, word: "新しい", defintion: "new"),
    Word(id: 17, word: "古い", defintion: "old"),
]

let name = "Quiz Review"
