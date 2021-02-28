//
//  ContentView.swift
//  iSpeak
//
//  Created by Sanduni Chamika on 2020-11-28.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Please place your phone in a comfortable distance and look at the pointer below.")
                    .multilineTextAlignment(.center)
                    .padding(.all)
                Spacer()
                // Calibration pointer
                Circle()
                    .fill(Color.blue)
                    .frame(width: 10, height: 10, alignment: .center)
                Spacer()
               //CameraView()
                NavigationLink(
                    destination: MainView()){
                    Text("Next")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                }
                
            }
            
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
