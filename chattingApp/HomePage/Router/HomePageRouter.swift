//
//  HomePageRouter.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

protocol HomePageRouting{
    func back(from view : UIViewController)
    func presentLoginPage(from view: UIViewController)
    func presentRegisterPage(from view : UIViewController)
}

class HomePageRouter : HomePageRouting {
    
    var viewController : UIViewController {
        let view = HomePageViewController()
        
        view.modalPresentationStyle = .fullScreen
        
        let presenter = HomePagePresenter(router: self, view: view)
        
        view.presenter = presenter
        
        return view
    }
    
    func presentLoginPage(from view : UIViewController) {
        view.present(LoginPageRouter().viewController, animated: true)
    }
    
    func presentRegisterPage(from view: UIViewController) {
        
    }
    
    func back(from view: UIViewController) {
        //view.dismiss(animated: true)
    }
}
