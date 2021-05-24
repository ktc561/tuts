//
//  SplashScreen.swift
//  LoginTest
//
//  Created by MacBook Pro on 5/17/21.
//

import SwiftUI

struct SplashScreen: View {
    @State var uemail = ""
    @State var pword = ""
    
    var body: some View {
        ZStack{
            Color(UIColor.systemBackground).ignoresSafeArea()
            VStack{
                VStack{
                    
                    Text("Title")
                    Image("slideshow")
                }
                Spacer()
                VStack{
                    TextField("Email", text: $uemail)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.85, height: 60)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8.0)
                    SecureField("Password", text: $pword)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.85, height: 60)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8.0)
                    HStack{
                        Spacer()
                        Text("Placeholder")
                        
                    }.frame(width: UIScreen.main.bounds.width * 0.83, height: 20)
                    .padding()
                    VStack(spacing: 15){
                        Button(action: {}, label: {
                            Text("Login")
                                .fontWeight(.semibold)

                                .foregroundColor(.white)
                        })  .frame(width: UIScreen.main.bounds.width * 0.5, height: 60)
                        .background(Color.green)
                        .cornerRadius(8.0)
                        
                        
                        Button(action: {}, label: {
                            Text("Sign Up")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        })  .frame(width: UIScreen.main.bounds.width * 0.5, height: 60)
                        .background(Color.blue)
                        .cornerRadius(8.0)
                    }
                    
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
            .preferredColorScheme(.dark)
    }
}
