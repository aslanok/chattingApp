//
//  LoginPageUseCase.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import Foundation
import Firebase

protocol LoginPageUseCaseInput {
    func execute(email : String, password : String)
}

protocol LoginPageUseCaseOutput {
    func setLoginSuccess()
    func setLoginFailed(errorMessage : String)
}

class LoginPageUseCase : LoginPageUseCaseInput {
    internal var output : LoginPageUseCaseOutput?
    
    func execute(email: String, password: String) {
        if email != "" && password != "" {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.output?.setLoginFailed(errorMessage: e.localizedDescription)
                } else {
                    self.output?.setLoginSuccess()
                }
                
                
            }
        }
    }
}
