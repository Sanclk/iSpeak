//
//  HomeView.swift
//  iSpeak
//
//  Created by Sanduni Chamika on 2020-11-28.
//

import SwiftUI

struct MainView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView (selection: $selection){
            //Command Tab
            CommandView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "doc.richtext.fill")
                    Text("Command")
                }
                .tag(0)
            //Type Tab
            KeyBoardView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "pencil.circle.fill")
                    Text("Type")
                }
                .tag(1)
            //Settings Tab
            SettingsView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
                .tag(2)
            
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
