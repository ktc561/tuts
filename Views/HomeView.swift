//
//  HomeView.swift
//  Firebase Login
//
//  Created by MacBook Pro on 4/29/21.
//

import SwiftUI
import Firebase
//when homeView appears check to see if theres a current user based on auth


struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        NavigationView {
            Text("Logged In as User: \(userInfo.user.name)")
                .navigationBarTitle("Fire Base Log in")
                .navigationBarItems(trailing: Button("Log Out") {
//                    self.userInfo.isUserAuthenticated = .signedOut
                    FBAuth.logout { (result) in
                        print("Logged out")
                    }
                    
                })
                .onAppear{
                    //check for existence of current user then assign user uid to a constant u can pass into func
                    guard let uid = Auth.auth().currentUser?.uid else {
                        return
                    }
                    FBFirestore.retrieveFBUser(uid: uid) { (result) in
                            switch result {
                            case .failure(let error):
                                print(error.localizedDescription)
                                //if successful assign user to user info inst
                            //display alert
                            case .success(let user):
                                self.userInfo.user = user
                            }
                        }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
