//
//  KeyboardView.swift
//  iSpeak
//
//  Created by Sanduni Chamika on 2020-12-19.
//

import SwiftUI

enum KeyButtons : String{
    case one,two,three,four,five,six,seven,eight,nine,zero
    case a,e,i,o,u
    case t,n,s,h,r,d,l,c,m,w,f,g,y,p,b,v,k,j,x,q,z
    case space,stop,del,say
    
    var keyBackground: Color {
        switch self{
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero:
            return Color(.darkGray)
        case .a, .e, .i, .o, .u:
            return Color(.systemGray)
        case .space, .stop, .del, .say:
            return Color(.systemOrange)
        default:
            return Color(.systemBlue)
        }
    }
    
    var title: String{
        switch self{
        case .one: return "0"
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

//environment object
struct KeyBoardView: View {
    
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
            
            VStack (spacing: 5){
                HStack{
                    //Display text
                    Spacer()
                    Text("Hello")
                        .foregroundColor(.black)
                        .font(.system(size: 32))
                }.padding()
                
                ForEach(keys, id: \.self){ row in
                    HStack (spacing: 5){
                        ForEach(row, id: \.self){ button in
                            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                                Text(button.title)
                                    .font(.system(size: 35))
                                    .frame(width:self.KeyWidth(button: button), height: self.KeyWidth(button: button))
                                    .foregroundColor(.white)
                                    .background(button.keyBackground)
                                    .cornerRadius(self.KeyWidth(button: button))
                            }
                        }
                    }
                }
                Spacer()
            }.padding(.bottom)
        }.padding(.bottom)
    }
    
    private func KeyWidth(button: KeyButtons) -> CGFloat{
        return (UIScreen.main.bounds.width - 6 * 5) / 5
    }
}

struct KeyBoardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyBoardView()
    }
}

