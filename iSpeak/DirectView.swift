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
    
    var title: String{
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

//Environment Object
//this the global application state
class GlobalEnvironment: ObservableObject {
    @Published var display = ""
    
    func recieveInput(commandButton: CommandButton){
        self.display = commandButton .title
    }
}

struct CommandView: View {
    @EnvironmentObject var env: GlobalEnvironment
    
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
                    Text(env.display)
                        .font(.system(size: 45))
                }
                .padding()
                
                ForEach(buttons, id: \.self){ row in
                    HStack (spacing: 12){
                        ForEach(row, id: \.self){ button in
                            CommandButtonView(button: button)
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
    
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View{
        Button(action: {
            //recieving input
            self.env.recieveInput(commandButton: button)
            //synthesizing speech
            let synth = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string: "Okay")
            synth.speak(utterance)
            
        }) {
            Text(button.title)
                .font(.system(size: 35))
                .frame(width: self.buttonWidth(), height: 60)
        }.buttonStyle(TypeButtonStyle())
    }
    private  func buttonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 4 * 12) / 3
    }
}

struct TypeButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
            .background(configuration.isPressed ? Color.orange : Color.blue)
            .cornerRadius(10.0)
    }
}

struct CommandView_Previews: PreviewProvider {
    static var previews: some View {
        CommandView()
    }
}


