//
//  ContentViewModel.swift
//  LoginMVVM
//
//  Created by Stefan Bayne on 11/16/22.
//

import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        
        @AppStorage("AUTH_KEY") var authenticated = false {// key to be stored by userdefaults
            willSet {// tells program object will change - same as @Published annotation
                objectWillChange.send()
            }
        }
        
        @AppStorage("USER_KEY") var username = "username" // key for program remembers username upon logout
        @Published var password = "password"
        @Published var invalid: Bool = false
        
        /*
         What the user has to type in to be validated.
         */
        private var sampleUser = "username"
        private var samplePassword = "password"
        
        /*
         Init block for when the view model is first created.
         */
        init() {
            print("Currently logged on: \(authenticated)")
            print("Current User: \(username)")
        }
        
        /*
         Method to toggle the authentication.
         */
        func adjustAuthentication() {
            self.password = ""
            withAnimation {
                authenticated.toggle() // turns to true and false
            }
        }
        
        /*
         Method to check if username and password is correct.
         */
        func authenticate() {
            guard self.username.lowercased() == sampleUser else {
                self.invalid == true
                return
            }
            
            guard self.password.lowercased() == samplePassword else {
                self.invalid == true
                return
            }
            // toggle accordingly to information
            adjustAuthentication()
        }
        
        /*
         What the toggle does when logged out.
         */
        func logOut() {
            adjustAuthentication()
        }
        
        /*
         For the buttons that don't do anything for this example.
         */
        func buttonsNotUsed() {
            print("Add some code!")
        }
    }
}
