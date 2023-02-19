//
//  LoginPageRouter.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//
import UIKit

protocol LoginPageRouting {
    func back(from view: UIViewController)
    func presentMessagesMainPage(from view: UIViewController)
}

class LoginPageRouter : LoginPageRouting {
    
    var viewController : UIViewController {
        let view = LoginPageViewController()
        let loginCase = LoginPageUseCase()
        
        view.modalPresentationStyle = .fullScreen
        //let archiver =
        //let consumer =
        //let fetch
        
        let presenter = LoginPagePresenter(router: self, view: view, loginCase: loginCase)
        
        
        //fetchAsadjk.output = presenter
        loginCase.output = presenter
        view.presenter = presenter
        
        presenter.output = view
        return view
    }
    
    func presentMessagesMainPage(from view: UIViewController) {
        view.present(MessagesMainPageRouter().viewController, animated: true)
    }
    
    func back(from view : UIViewController) {
        view.dismiss(animated: true)
    }
}
