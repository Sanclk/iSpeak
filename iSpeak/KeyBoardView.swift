//
//  KeyboardView.swift
//  iSpeak
//
//  Created by Sanduni Chamika on 2020-12-19.
//

import SwiftUI
import AVFoundation

enum KeyButtons : String{
    case one,two,three,four,five,six,seven,eight,nine,zero
    case a,e,i,o,u
    case t,n,s,h,r,d,l,c,m,w,f,g,y,p,b,v,k,j,x,q,z
    case space,stop,del,say
    
    var keyBackground: Color {
        switch self{
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero:
            return Color(.systemGray)
        case .a, .e, .i, .o, .u:
            return Color(.darkGray)
        case .space, .stop, .del, .say:
            return Color(.systemOrange)
        default:
            return Color(.systemBlue)
        }
    }
    
    var title: String{
        switch self{
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .zero: return "0"
        case .a: return "A"
        case .e: return "E"
        case .i: return "I"
        case .o: return "O"
        case .u: return "U"
        case .t: return "T"
        case .n: return "N"
        case .s: return "S"
        case .h: return "H"
        case .r: return "R"
        case .d: return "D"
        case .l: return "L"
        case .c: return "C"
        case .m: return "M"
        case .w: return "W"
        case .f: return "F"
        case .g: return "G"
        case .y: return "Y"
        case .p: return "P"
        case .b: return "B"
        case .v: return "V"
        case .k: return "K"
        case .j: return "J"
        case .x: return "X"
        case .q: return "Q"
        case .z: return "Z"
        case .space: return "|_|"
        case .stop: return "."
        case .del: return "DEL"
        default: return "SAY"
        }
        
    }}

struct KeyBoardView: View {
    
    @State var display = ""
    
    @ObservedObject var keyViewState: KeyViewState = KeyViewState()
    
    
    func recieveInput(letterKeys: KeyButtons) {
        self.display = letterKeys.title
    }
    
    let keys : [[KeyButtons]] = [
        [ .one, .two, .three, .four, .five],
        [.six, .seven, .eight, .nine, .zero],
        [ .a, .e, .i, .o, .u],
        [.t, .n, .s, .h, .r],
        [ .d, .l, .c, .m, .w],
        [.f, .g, .y, .p, .b],
        [.v, .k, .j, .x, .q],
        [.z, .space, .stop, .del, .say]
    ]
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            //setting the background color
            Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack (spacing: 3){
                HStack{
                    //Display text
                    Spacer()
                    Text("\(keyViewState.letter)")
                        .foregroundColor(.black)
                        .font(.system(size: 32))
                }.padding()
                
                ForEach(keys, id: \.self){ row in
                    HStack (spacing: 5){
                        ForEach(row, id: \.self){ button in
                            KeysView(btn: button).environmentObject(keyViewState)
                        }
                    }
                }
                Spacer()
            }.padding(.bottom)
        }.padding(.bottom)
    }
    
}

struct KeysView: View {
    
    var btn: KeyButtons

    @EnvironmentObject var keyViewState: KeyViewState
    
    var body: some View {
        Button(action: {
            keyViewState.appendLetter(str: btn.title)
        
            //synthesizing speech
            let synth = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string: "\(keyViewState.letter)")
            synth.speak(utterance)
            
        }) {
            Text(btn.title)
                .font(.system(size: 35))
                .frame(width:self.KeyWidth(button: btn), height: self.KeyHeight(button: btn))
                .foregroundColor(.white)
                .background(btn.keyBackground)
                .cornerRadius(self.KeyWidth(button: btn))
        }
    }
    
    private func KeyWidth(button: KeyButtons) -> CGFloat{
        return (UIScreen.main.bounds.width - 6 * 5) / 5
    }
    
    private func KeyHeight(button: KeyButtons) -> CGFloat{
        return (UIScreen.main.bounds.height - 260 - 9 * 3) / 8
    }
}

class KeyViewState: ObservableObject{
    
    @Published var letter = ""
    
    
    func appendLetter(str: String) {
        letter += str
    }
    
}

struct KeyBoardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyBoardView()
    }
}

