import Foundation

public struct Word {
    let id: Int
    let word: String
    let defintion: String
    
    public init(id: Int, word: String, definition: String) {
        self.id = id;
        self.word = word;
        self.defintion = definition;
    }
}
