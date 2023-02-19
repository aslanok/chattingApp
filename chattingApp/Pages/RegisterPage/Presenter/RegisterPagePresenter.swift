//
//  RegisterPagePresenter.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

protocol RegisterPagePresentation {
    func back()
    func createUser(email : String, password : String)
}

class RegisterPagePresenter : RegisterPagePresentation, RegisterPageUseCaseOutput{
    
    internal var output : RegisterPageViewContract
    let router : RegisterPageRouting
    private var registerCase : RegisterPageUseCaseInput!
    
    init(router : RegisterPageRouting, view: RegisterPageViewContract, registerPageUseCase : RegisterPageUseCaseInput){
        self.router = router
        self.output = view
        self.registerCase = registerPageUseCase
    }
    
    func createUser(email: String, password: String) {
        registerCase.execute(email: email, password: password)
    }
    
    func setRegisterSuccess() {
        print("kaydetme başarılı")
        output.registerCompleted()
    }
    
    func setRegisterFailed(errorMessage: String) {
        print("error : \(errorMessage)")
        output.registerFailed()
    }
    
    func back() {
        router.back(from: output)
    }
    
}
