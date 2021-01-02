//
//  SynthesizeView.swift
//  iSpeak
//
//  Created by Sanduni Chamika on 2020-12-18.
//

import SwiftUI
import AVFoundation

class SpeachViewModel: NSObject, ObservableObject, AVSpeechSynthesizerDelegate {
    @Published var isSpeaking = false

    private var synthesizer = AVSpeechSynthesizer()
    override init() {
        super.init()
        synthesizer.delegate = self
    }

    deinit {
        synthesizer.delegate = nil
    }

    func speak(_ utterance: AVSpeechUtterance) {
        self.synthesizer.speak(utterance)
    }

    // MARK: AVSpeechSynthesizerDelegate
    internal func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        self.isSpeaking = true
    }

    internal func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.isSpeaking = false
    }

    internal func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        self.isSpeaking = false
    }

    internal func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        self.isSpeaking = false
    }

    internal func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        self.isSpeaking = true
    }
}

struct SynthesizeView: View {
    @ObservedObject var vm = SpeachViewModel()
       var utterance = AVSpeechUtterance(string: "Hello World")
    
    var body: some View {
        VStack {
                    Text(vm.isSpeaking ? "Speaking" : "Not Speaking")
                    Button(action: {vm.speak(utterance)}) {
                        Text("Speak To Me")
                    }
                }
    }
}

struct SynthesizeView_Previews: PreviewProvider {
    static var previews: some View {
        SynthesizeView()
    }
}
