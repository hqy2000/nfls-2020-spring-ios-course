import SwiftUI
import PlaygroundSupport

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
        Text("寝る")
    }
}

struct DefinitionView: View {
    var body: some View {
        Text("to sleep")
    }
}

PlaygroundPage.current.setLiveView(ContentView())
