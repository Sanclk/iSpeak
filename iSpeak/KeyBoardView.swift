//
//  KeyboardView.swift
//  iSpeak
//
//  Created by Sanduni Chamika on 2020-12-19.
//

import SwiftUI

struct KeyBoardView: View {
    @State var message: String = ""
    
    var body: some View {
        VStack{
            GeometryReader { geometry in
                HStack(spacing: 1.0) {
                    Button(action: {
                        //TODO clicked1
                    }, label: {
                        Text ("1")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width / 5, height: 50)
                    })
                    Button(action: {
                        //TODO clicked1
                    }, label: {
                        Text ("2")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width / 5, height: 50)
                    })
                    Button(action: {
                        //TODO clicked1
                    }, label: {
                        Text ("3")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width / 5, height: 50)
                    })
                    Button(action: {
                        //TODO clicked1
                    }, label: {
                        Text ("4")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width / 5, height: 50)
                    })
                    Button(action: {
                        //TODO clicked1
                    }, label: {
                        Text ("5")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width / 5, height: 50)
                    })
                }
            }
            GeometryReader { geometry in
                HStack(spacing: 1.0) {
                    Button(action: {
                        //TODO clicked1
                    }, label: {
                        Text ("6")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width / 5, height: 50)
                    })
                    Button(action: {
                        //TODO clicked1
                    }, label: {
                        Text ("7")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width / 5, height: 50)
                    })
                    Button(action: {
                        //TODO clicked1
                    }, label: {
                        Text ("8")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width / 5, height: 50)
                    })
                    Button(action: {
                        //TODO clicked1
                    }, label: {
                        Text ("9")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width / 5, height: 50)
                    })
                    Button(action: {
                        //TODO clicked1
                    }, label: {
                        Text ("0")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width / 5, height: 50)
                    })
                }
                
                GeometryReader { geometry in
                    HStack(spacing: 1.0) {
                        Button(action: {
                            //TODO clicked1
                        }, label: {
                            Text ("a")
                                .fontWeight(.semibold)
                                .font(.largeTitle)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(5)
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 5, height: 50)
                        })
                        Button(action: {
                            //TODO clicked1
                        }, label: {
                            Text ("e")
                                .fontWeight(.semibold)
                                .font(.largeTitle)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(5)
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 5, height: 50)
                        })
                        Button(action: {
                            //TODO clicked1
                        }, label: {
                            Text ("i")
                                .fontWeight(.semibold)
                                .font(.largeTitle)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(5)
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 5, height: 50)
                        })
                        Button(action: {
                            //TODO clicked1
                        }, label: {
                            Text ("o")
                                .fontWeight(.semibold)
                                .font(.largeTitle)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(5)
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 5, height: 50)
                        })
                        Button(action: {
                            //TODO clicked1
                        }, label: {
                            Text ("u")
                                .fontWeight(.semibold)
                                .font(.largeTitle)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(5)
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 5, height: 50)
                        })
                        
                    }
                }}
            TextEditor(text: $message).modifier(ClearButton(text: $message))
                //            TextField("Enter your message...", text: $message).modifier(ClearButton(text: $message))
                .font(.system(size: 30))
                .padding()
            
            Button(action: {
                SynthesizeView()
            }, label: {
                HStack {
                    Image (systemName: "speaker.wave.2.fill")
                        .font(.largeTitle)
                    Text ("Speak")
                        .fontWeight(.semibold)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(20)
                .foregroundColor(.white)
                .shadow(color: Color.gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 3 )
            })
        }
        
    }
}

struct ClearButton: ViewModifier
{
    @Binding var text: String
    
    public func body(content: Content) -> some View
    {
        ZStack(alignment: .trailing)
        {
            content
            
            if !text.isEmpty
            {
                Button(action:
                        {
                            self.text = ""
                        })
                {
                    Image(systemName: "delete.left")
                        .padding()
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                        .shadow(color: Color.gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 3 )
                }
                .padding(.trailing, 8)
            }
        }
    }
}

struct KeyBoardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyBoardView()
    }
}
