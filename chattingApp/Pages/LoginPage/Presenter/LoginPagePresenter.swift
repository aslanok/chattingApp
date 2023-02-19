//
//  LoginPagePresenter.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

class LoginPagePresenter : LoginPagePresentation, LoginPageUseCaseOutput {
    
    internal var output : LoginPageViewContract
    private var loginCase : LoginPageUseCaseInput
    let router : LoginPageRouting
    
    init(router : LoginPageRouting, view: LoginPageViewContract, loginCase : LoginPageUseCaseInput){
        self.router = router
        self.output = view
        self.loginCase = loginCase
    }
    
    func logInCheck(email: String, password: String) {
        loginCase.execute(email: email, password: password)
    }
    
    func setLoginSuccess() {
        print("logIn SuccessFull")
        router.presentMessagesMainPage(from: output)
    }
    
    func setLoginFailed(errorMessage: String) {
        print("logIn Failed")
        output.logInFailed()
    }
    
    
    func back() {
        print("presenter'a geçtik")
        router.back(from: output)
    }
}
