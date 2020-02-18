import SwiftUI
import PlaygroundSupport




class WordData: ObservableObject {
    struct Word {
        let word: String
        let defintion: String
    }

    let words = [
        Word(word: "寝る", defintion: "to sleep"),
        Word(word: "する", defintion: "to do"),
        Word(word: "食べる", defintion: "to eat")
    ]
    
    private var index: Int = 0{
        didSet {
            self.word = current.word
            self.definition = current.defintion
        }
    }
    private var current: Word {
        return words[index]
    }
    
    @Published var word = ""
    @Published var definition = ""
    
    init() {
        self.word = current.word
        self.definition = current.defintion
    }
    
    public func next() {
        self.index += 1
    }
}

struct ContentView: View {
    var body: some View {
        CardView()
    }
}

struct CardView: View {
    @State private var showingDefinition = true
    private var word: WordData = WordData()
    
    var body: some View {
        VStack {
            if showingDefinition {
                WordView()
                    .environmentObject(self.word)
                    .onTapGesture {
                        self.showingDefinition.toggle()
                    }
                    .onLongPressGesture {
                        self.word.next()
                    }
                    
            } else {
                DefinitionView()
                    .environmentObject(self.word)
                    .onTapGesture {
                        self.showingDefinition.toggle()
                    }
                    .onLongPressGesture {
                        self.word.next()
                    }
                    
            }
        }
    }
}

struct WordView: View {
    @EnvironmentObject var word: WordData
    
    var body: some View {
        Text(word.word)
    }
}

struct DefinitionView: View {
    @EnvironmentObject var word: WordData
    
    var body: some View {
        Text(word.definition)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
