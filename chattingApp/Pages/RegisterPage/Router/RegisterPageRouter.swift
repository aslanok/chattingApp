//
//  RegisterPageRouter.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

protocol RegisterPageRouting {
    func back(from view : UIViewController)
}

class RegisterPageRouter : RegisterPageRouting {
    
    var viewController : UIViewController {
        let view = RegisterPageViewController()
        
        let registerPageUseCase = RegisterPageUseCase()

        let presenter = RegisterPagePresenter(router: self, view: view, registerPageUseCase: registerPageUseCase)
        
        
        view.modalPresentationStyle = .fullScreen

        registerPageUseCase.output = presenter
        view.presenter = presenter
        
        presenter.output = view
        return view
    }
    
    func back(from view: UIViewController) {
        view.dismiss(animated: true)
    }
    
    
}
