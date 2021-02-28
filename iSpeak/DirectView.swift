//
//  DirectView.swift
//  iSpeak
//
//  Created by Sanduni Chamika on 2020-12-19.
//

import SwiftUI
import AVFoundation

enum CommandButton: String {
    case i, we, you, my, your, our, eat, wash, go, look, think, out, stop, rice, want, more, help, it, know,drink, water, yes, no, okay
    
    var btnLabel: String{
        switch self{
        case .we: return "we"
        case .you: return "you"
        case .my: return "my"
        case .your: return "your"
        case .our: return "our"
        case .eat: return "eat"
        case .wash: return "wash"
        case .go: return "go"
        case .look: return "look"
        case .think: return "think"
        case .out: return "out"
        case .stop: return "stop"
        case .rice: return "rice"
        case .want: return "want"
        case .more: return "more"
        case .help: return "help"
        case .it: return "it"
        case .know: return "know"
        case .drink: return "drink"
        case .water: return "water"
        case .yes: return "yes"
        case .no: return "no"
        case .okay: return "okay"
        default: return "i"
        }
    }
}

struct CommandView: View {
    
    @State var displaytext = ""
    
    @ObservedObject var commandViewState: CommandViewState = CommandViewState()
    
    
    func recieveInput(commandBtns: CommandButton) {
        self.displaytext = commandBtns.btnLabel
    }
    
    
    let buttons: [[CommandButton]] = [
        [.i, .we, .you],
        [.my, .your, .our],
        [.eat, .wash, .go],
        [.look, .think, .out],
        [.stop, .rice, .want],
        [.more, .help, .it],
        [.know, .drink, .water],
        [.yes, .no, .okay]
    ]
    
    var body: some View {
        ZStack(alignment: .bottom){
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 12){
                
                HStack{
                    Spacer()
                    Text("\(commandViewState.word)")
                        .font(.system(size: 45))
                }
                .padding()
                
                ForEach(buttons, id: \.self){ row in
                    HStack (spacing: 12){
                        ForEach(row, id: \.self){ button in
                            CommandButtonView(button: button).environmentObject(commandViewState)
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
    
}

struct CommandButtonView: View {
    var button: CommandButton
    
    @EnvironmentObject var commandViewState: CommandViewState
    
    var body: some View{
        Button(action: {
            //recieving input
            commandViewState.appendWord(str: button.btnLabel)
            //synthesizing speech
            let synth = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string: "Okay")
            synth.speak(utterance)
            
        }) {
            Text(button.btnLabel)
                .font(.system(size: 35))
                .frame(width: self.buttonWidth(), height: 60)
        }.buttonStyle(TypeButtonStyle())
    }
    private  func buttonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 4 * 12) / 3
    }
}

class CommandViewState: ObservableObject{
    
    @Published var word = ""
    
    
    func appendWord(str: String) {
        word += str
    }
    
}

struct TypeButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .scaleEffect(configuration.isPressed ? 1.5 : 1.0)
            .background(configuration.isPressed ? Color.orange : Color.blue)
            .cornerRadius(10.0)
    }
}

struct CommandView_Previews: PreviewProvider {
    static var previews: some View {
        CommandView()
    }
}


