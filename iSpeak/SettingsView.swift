//
//  SettingsView.swift
//  iSpeak
//
//  Created by Sanduni Chamika on 2021-03-01.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack{
            
            //logo
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFit()
            Spacer()
            Text("Plese look at the recalibrate button for recalibration.")
                .font(.system(size: 28))
                .multilineTextAlignment(.center)
            Spacer()
            Button(action: {
                //navigate to the calibration
            }) {
                Text("Recalibrate")
                    .font(.system(size: 35))
                    .padding()
                    .padding(.bottom, 0)
                    .padding(.top, 0)
            }
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(35)
            Spacer()
            //version and link
            Text("Version 1.0")
            Link("https://github.com/Sanclk/iSpeak", destination: URL(string: "https://github.com/Sanclk/iSpeak")!)
        }.padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
