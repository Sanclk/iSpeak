//
//  ContentView.swift
//  iSpeak
//
//  Created by Sanduni Chamika on 2020-11-28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Please hold your phone in a comfortable distance.")
                .multilineTextAlignment(.center)
                .padding(.all)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
