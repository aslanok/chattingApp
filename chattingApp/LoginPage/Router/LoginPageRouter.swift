//
//  LoginPageRouter.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//
import UIKit

protocol LoginPageRouting {
    func back(from view: UIViewController)
}

class LoginPageRouter : LoginPageRouting {
    
    var viewController : UIViewController {
        let view = LoginPageViewController()
        
        view.modalPresentationStyle = .fullScreen
        //let archiver =
        //let consumer =
        //let fetch
        
        let presenter = LoginPagePresenter(router: self, view: view)
        
        
        //fetchAsadjk.output = presenter
        
        view.presenter = presenter
        
        
        return view
    }
    
    
    func back(from view : UIViewController) {
        view.dismiss(animated: true)
    }
}
