//
//  WordData.swift
//  FlashCard
//
//  Created by Qingyang Hu on 2/17/20.
//  Copyright © 2020 Qingyang Hu. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation

public class CardData: ObservableObject {
    let synthesizer = AVSpeechSynthesizer()
    @Published var word = ""
    @Published var definition = ""
    @Published var passed = false
    @Published var isCompleted = false {
        didSet {
            if !isCompleted {
                self.index = 0
            }
        }
    }
    @Published var showDefinition = false
    @Published var showBackSide = false {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.18) {
                self.showDefinition = self.showBackSide
            }
        }
    }
    
    private var index: Int = 0 {
        didSet {
            self.word = current.word
            self.definition = current.defintion
            
            // Speak aloud!
            let utterance = AVSpeechUtterance(string: self.word)
            utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            utterance.rate = 0.3
            synthesizer.speak(utterance)
        }
    }
    
    private var current: Word {
        return words[index]
    }
    
    init() {
        defer {
            self.index = 0
        }
    }
    
    public func next() {
        if self.index + 1 >= words.count {
            self.isCompleted = true
        } else {
            self.index += 1
        }
        self.showBackSide = false
        self.showDefinition = false
    }
}
