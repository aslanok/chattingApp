//
//  MessagesMainPageRouter.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

protocol MessagesMainPageRouting {
    func back(from view: UIViewController)
}

class MessagesMainPageRouter : MessagesMainPageRouting {
    
    var viewController: UIViewController {
        let view = MessagesMainPageViewController()
        
        
        let presenter = MessagesMainPagePresenter(router: self, view: view)
        
        view.presenter = presenter
        
        presenter.output = view
        return view
    }
    
    
    func back(from view: UIViewController) {
        
    }
}
