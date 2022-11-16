//
//  ContentView.swift
//  LoginMVVM
//
//  Created by Stefan Bayne on 11/16/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("DarkerBlue").ignoresSafeArea(.all, edges: .all)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
