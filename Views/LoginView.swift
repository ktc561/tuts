//
//  LoginView.swift
//  Firebase Login
//
//  Created by MacBook Pro on 4/29/21.
//

import SwiftUI

struct LoginView: View {
    //access userinfo env obj
    //using views to deal w user info
    // this will go through an enum and present one of 2 sheets depending on the action
    //
    
    enum Action {
        case signUp, resetPW
    }
    
    @State private var showSheet = false
    @State private var action: Action = .signUp
    
    var body: some View {
        VStack{
            SignInWithEmailView(showSheet: $showSheet, action: $action)
            SignInWithAppleView().frame(width: 200, height: 50)
            Spacer()
    }
                .sheet(isPresented: $showSheet) {
                    if self.action == .signUp {
                        SignUpView()
                    } else{
                        ForgotPasswordView()
                    }
                }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
