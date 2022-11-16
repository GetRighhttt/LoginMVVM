//
//  ContentView.swift
//  LoginMVVM
//
//  Created by Stefan Bayne on 11/16/22.
//

import SwiftUI

/*
 A sample login page with a custom color palette.
 
 Their is also an alert dialog box example.
 */
struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @State private var showAlert = false
    
    var body: some View {
        
        /*
         Checks wether or not the user is aunthenticated.
         Displays the screen based on the boolean variable.
         */
        if viewModel.authenticated {
            ZStack {
                
                Color("Pink").opacity(0.8).ignoresSafeArea() // bg
                
                VStack(alignment: .center, spacing: 40) {
                    
                    Spacer()
                    
                    Text("Login Successful!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("DarkerBlue"))
                    
                    Image(systemName: "lock.open.desktopcomputer")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 105, height: 105)
                        .foregroundColor(Color("DarkerBlue"))
                    
                    Text("Welcome back \(viewModel.username.uppercased())!")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("DarkerBlue"))
                    
                    Spacer()
                    
                    Button("Back to Login Screen", action: viewModel.logOut)
                        .frame(width: 320, height: 70)
                        .font(.system(size: 26))
                        .foregroundColor(Color("Pink"))
                        .background(Color("DarkerBlue"))
                        .cornerRadius(10)
                        .padding(.bottom, 30)
                        .shadow(radius: 5)
                }
                .padding()
            }
        } else {
            
            /*
             If user is validated, this stack shows.
             */
            ZStack {
                Color("DarkerBlue").ignoresSafeArea(.all, edges: .all) // bg
                
                VStack(spacing: 20) {
                    Text("Welcome!")
                        .font(.system(size: 65))
                        .bold()
                        .foregroundColor(Color("Pink"))
                        .padding(.top, 60)
                        .textCase(.uppercase)
                        .shadow(radius: 5)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Begin...")
                            .font(.system(size: 45))
                            .bold()
                            .foregroundColor(Color("Pink"))
                            .shadow(radius: 5)
                        
                        TextField("Username", text: $viewModel.username)
                            .font(.system(size: 20))
                            .textFieldStyle(.roundedBorder)
                            .foregroundColor(Color("Pink"))
                            .font(.headline)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .textInputAutocapitalization(.never)
                        
                        SecureField("Password", text: $viewModel.password)
                            .font(.system(size: 20))
                            .foregroundColor(Color("Pink"))
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .textInputAutocapitalization(.never)
                            .privacySensitive() // very important
                        
                        HStack {
                            Spacer()
                            
                            Button("Forgot Password") {
                                showAlert = true
                            }
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(Color("Pink"))
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            
                            Spacer()
                            
                        } // alert dialog box demo below
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Forgot Password:"),
                                message: Text("A link has been sent to your email."),
                                primaryButton: .default( // blue outline
                                    Text("Resend"),
                                    action: viewModel.buttonsNotUsed
                                ),
                                secondaryButton: .destructive( // red outline
                                    Text("Dismiss"),
                                    action: viewModel.buttonsNotUsed
                                )
                            )
                        }
                    }
                    
                    Spacer()
                    
                    Button("Login", action: viewModel.authenticate)
                        .frame(width: 320, height: 70)
                        .font(.system(size: 30))
                        .foregroundColor(Color("DarkerBlue"))
                        .background(Color("Pink"))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.bottom, 30)
                }
                .padding()
                .alert("Access Denied", isPresented: $viewModel.invalid) {
                    Button("Dismiss", action: viewModel.buttonsNotUsed)
                }
            } // animation. The best way to do it!
            .transition(.scale)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
