//
//  LoginPageRouter.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//
import UIKit

protocol LoginPageRouting {
    func presentHomePage(from view: UIViewController)
}

class LoginPageRouter : LoginPageRouting {
    
    var viewController : UIViewController {
        let view = LoginViewController()
        
        //let archiver =
        //let consumer =
        //let fetch
        
        let presenter = LoginPagePresenter(router: self, view: view)
        
        
        //fetchAsadjk.output = presenter
        
        view.presenter = presenter
        
        
        return view
    }
    
    
    func presentHomePage(from view : UIViewController) {
        DispatchQueue.main.async {
            view.present(HomePageRouter().viewController, animated: true)
        }
    }
}
