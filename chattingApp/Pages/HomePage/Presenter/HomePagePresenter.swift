//
//  HomePagePresenter.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

protocol HomePagePresentation{
    func goLoginPage()
    func goRegisterPage()
}

class HomePagePresenter : HomePagePresentation {
    
    let output : HomePageViewContract
    let router : HomePageRouting
    
    init(router : HomePageRouting, view: HomePageViewContract){
        self.output = view
        self.router = router
    }
    
    func goLoginPage() {
        router.presentLoginPage(from: output)
    }
    
    func goRegisterPage() {
        router.presentRegisterPage(from: output)
    }
    
}
