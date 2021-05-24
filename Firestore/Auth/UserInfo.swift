//
//  UserInfo.swift
//  Firebase Login
//
//  Created by MacBook Pro on 4/29/21.
//

import Foundation
import FirebaseAuth
//to setup AUTH changelistener

class UserInfo: ObservableObject {
    //login state 1 of 3 cases perfect for enum
    enum FBAuthState {
        case undefined, signedOut, signedIn
        
    }
    //monitor changes publish
    @Published var isUserAuthenticated: FBAuthState = .undefined
    @Published var user: FBUser = .init(uid: "",name: "", email: "" )
    //listening if the auth state has chnanged on fb side
    //create optional auth state did change listener handle
    var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle?
    
    //in order to change the state we'll make a func to configure our fbDidStateChange listener
    func configureFirebaseStateDidChange() {
      //  self.isUserAuthenticated = .signedOut
        //        self.isUserAuthenticated = .signedOut
        //update or config did change func
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener({ (_, user) in
            guard let user = user else {
                self.isUserAuthenticated = .signedOut
                return
            }
            self.isUserAuthenticated = .signedIn
            
            //weak error handle because if user db is corrupted we'll never know move it to a view so we can present it to the view and handle the error
//            FBFirestore.retrieveFBUser(uid: user.uid) { (result) in
//                switch result {
//                case .failure(let error):
//                    print(error.localizedDescription)
//                    //if successful assign user to user info inst
//                case .success(let user):
//                    self.user = user
//                }
//            }
        })
        
    }
    
} // observ obj is defined now inject it into env. when the app first launches create a inst of user info so its available everywhere in app
