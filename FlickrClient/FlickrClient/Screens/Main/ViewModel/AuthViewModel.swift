//
//  AuthViewModel.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 18.10.2022.
//
//








import Foundation
import Firebase



//enum AuthViewModelChange {
//    case didErrorOccurred(_ error: Error)
//    case didSignUpSuccessful
//}
//
//final class AuthViewModel {
//    let vvv = AuthView()
//
//    //private let db = Firestore.firestore()
//
//    private let defaults = UserDefaults.standard
//
//    var changeHandler: ((AuthViewModelChange) -> Void)?
//
//
//    func signInTapped(){
//
//        print("signed in")
//
//    }
//
//    func signUpTapped(){
//        print("signed up")
//
//        let mail = vvv.email
//        let password = vvv.password
//        if mail != "" && password != "" {
//            Auth.auth().createUser(withEmail: mail!, password: password!) { authResult, error in
//                if error != nil {
//                    print("\(String(describing: error?.localizedDescription))")
//                } else {
//
//
//                }
//            }
//
//
//        } else {
//            print("boş")
//        }
//    }
//
//
//
//
//}
