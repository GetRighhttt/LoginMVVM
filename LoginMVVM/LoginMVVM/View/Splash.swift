//
//  Splash.swift
//  LoginMVVM
//
//  Created by Stefan Bayne on 11/16/22.
//

import SwiftUI

struct Splash: View {
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack {
            
            ContentView()
            
            ZStack {
                Color("Pink")
                Image(systemName: "keyboard.badge.eye.fill")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 130, height: animate ? nil : 130)
                    .foregroundColor(Color("DarkerBlue"))
                
                    .scaleEffect(animate ? 5 : 1)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea()
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            withAnimation(Animation.easeOut(duration: 0.55)) {
                animate.toggle()
            }
            
            withAnimation(Animation.easeIn(duration: 0.45)) {
                endSplash.toggle()
            }
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
