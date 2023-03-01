//
//  MessagesMainPageRouter.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

protocol MessagesMainPageRouting {
    func back(from view: UIViewController)
    func backToHome(from view: UIViewController)
}

class MessagesMainPageRouter : MessagesMainPageRouting {
    
    var viewController: UIViewController {
        let view = MessagesMainPageViewController()
        let messagesMainPageUseCase = MessagesMainPageUseCase()
        let messageSenderUseCase = MessageSenderUseCase()
        let messagesLoadUseCase = MessagesLoadUseCase()
        
        let presenter = MessagesMainPagePresenter(router: self, view: view, messagesMainPageCase: messagesMainPageUseCase, messageSenderCase: messageSenderUseCase, messagesLoadCase: messagesLoadUseCase)
        
        view.modalPresentationStyle = .fullScreen
        
        messagesMainPageUseCase.output = presenter
        messageSenderUseCase.output = presenter
        messagesLoadUseCase.output = presenter
        view.presenter = presenter
        
        presenter.output = view
        return view
    }
    
    func backToHome(from view: UIViewController) {
        view.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    func back(from view: UIViewController) {
        view.dismiss(animated: true)
    }
}
