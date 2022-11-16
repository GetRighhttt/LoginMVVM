//
//  ContentView.swift
//  LoginMVVM
//
//  Created by Stefan Bayne on 11/16/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        // if user is authenticated go to next screen
        if !viewModel.authenticated {
            ZStack {
                Color("Pink").ignoresSafeArea()
                VStack(alignment: .center, spacing: 40) {
                    Image(systemName: "hourglass")
                        .foregroundColor(Color("LightBlue")
                }
            }
        } else {
            // else show login screen
            ZStack {
                Color("DarkerBlue").ignoresSafeArea(.all, edges: .all)
                VStack {
                    
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
