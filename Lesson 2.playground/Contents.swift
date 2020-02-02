import SwiftUI
import PlaygroundSupport

struct Word {
    let word: String
    let defintion: String
}

let words = [Word(word: "寝る", defintion: "to sleep")]

struct ContentView: View {
    var body: some View {
        CardView()
    }
}

struct CardView: View {
    @State private var showingDefinition = true
    var body: some View {
        VStack {
            if showingDefinition {
                WordView()
                    .onTapGesture { self.showingDefinition.toggle()}
            } else {
                DefinitionView()
                   .onTapGesture { self.showingDefinition.toggle()}
            }
        }
    }
}

struct WordView: View {
    var body: some View {
        Text(words[0].word)
    }
}

struct DefinitionView: View {
    var body: some View {
        Text(words[0].defintion)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
