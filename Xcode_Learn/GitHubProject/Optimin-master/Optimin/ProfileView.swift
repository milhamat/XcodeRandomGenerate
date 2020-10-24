//
//  ProfileView.swift
//  Optimin
//
//  Created by Muhammad Nashrullah on 31/03/20.
//  Copyright © 2020 Muhammad Nashrullah. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    func signIn(){
        
    }
    
    var body: some View {
       NavigationView{
            VStack{
                Text("Welcome to Optimin!")
                    .font(.system(size:32, weight: .heavy))
                
                Text("Sign in to continue")
                    .font(.system(size:18, weight:.medium))
                    .foregroundColor(Color.gray)
                
                VStack (spacing:18){
                    TextField("Email address", text: $email)
                        .font(.system(size:14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.purple,
                                                                                   lineWidth:1))
                    
                    SecureField("Password", text: $password)
                        .font(.system(size:14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.purple,
                                                                                   lineWidth: 1))
                }
                .padding(.vertical, 32)
                Button(action:signIn){
                    Text("Sign in")
                        .frame(minWidth:0, maxWidth: .infinity)
                        .frame(height:50)
                        .foregroundColor(.white)
                        .font(.system(size:14, weight: .bold))
                        .background(LinearGradient(gradient:Gradient(colors: [Color.blue,Color.purple]),
                                                   startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(5)
                }
                if (error != ""){
                    Text(error)
                        .font(.system(size:14, weight: .semibold))
                        .foregroundColor(.red)
                        .padding()
                }
                Spacer()
                
                NavigationLink (destination: SignUpView()){
                    HStack{
                        Text("Don't have and account? ")
                            .font(.system(size:14, weight: .light))
                            .foregroundColor(.primary)
                        
                        Text("Register")
                            .font(.system(size:14, weight: .semibold))
                            .foregroundColor(Color.purple)
                    }
                }
                .padding(.bottom,16)
            }
            .padding(.horizontal, 32 )
        }}
}

struct SignUpView: View {
    var body: some View{
        NavigationView{
            Text("Sign Up pages")
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
