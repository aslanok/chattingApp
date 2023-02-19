//
//  LoginPagePresenter.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

class LoginPagePresenter : LoginPagePresentation {
    
    let output : LoginPageViewContract
    let router : LoginPageRouting
    
    init(router : LoginPageRouting, view: LoginPageViewContract){
        self.router = router
        self.output = view
    }
    
    func goOtherPage() {
        print("presenter'a geçtik")
        router.presentHomePage(from: output)
    }
}
