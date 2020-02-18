import Foundation
import SwiftUI
import PlaygroundSupport

let words = [
    Word(id: 0, word: "寝る", definition: "to sleep"),
    Word(id: 1, word: "する", definition: "to do"),
    Word(id: 2, word: "食べる", definition: "to eat"),
    Word(id: 3, word: "行く", definition: "to go"),
    Word(id: 4, word: "聞く", definition: "to listen"),
    Word(id: 5, word: "帰る", definition: "to come"),
    Word(id: 6, word: "飲む", definition: "to drink"),
    Word(id: 7, word: "読む", definition: "to read"),
    Word(id: 8, word: "起きる", definition: "to get up"),
    Word(id: 9, word: "食べる", definition: "to eat"),
    Word(id: 10, word: "浴びる", definition: "to take a bath"),
    Word(id: 11, word: "会う", definition: "to meet"),
    Word(id: 12, word: "大きい", definition: "big"),
    Word(id: 13, word: "小さい", definition: "small"),
    Word(id: 14, word: "多い", definition: "many"),
    Word(id: 15, word: "少ない", definition: "few"),
    Word(id: 16, word: "新しい", definition: "new"),
    Word(id: 17, word: "古い", definition: "old"),
]

let name = "Quiz Review"

PlaygroundPage.current.setLiveView(ContentView().environmentObject(CardData(words: words, name: name)))
