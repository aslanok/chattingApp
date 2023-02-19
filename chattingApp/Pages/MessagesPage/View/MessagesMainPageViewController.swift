//
//  MessagesViewController.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

protocol MessagesMainPageViewContract : UIViewController {
    
}

class MessagesMainPageViewController : UIViewController,MessagesMainPageViewContract {
    
    internal var presenter : MessagesMainPagePresentation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
    }
    
    
}
