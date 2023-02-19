//
//  MessagesMainPagePresenter.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

protocol MessagesMainPagePresentation{
    func back()
}

class MessagesMainPagePresenter: MessagesMainPagePresentation{
    
    let router : MessagesMainPageRouting
    internal var output : MessagesMainPageViewContract
    
    init(router : MessagesMainPageRouting, view : MessagesMainPageViewContract) {
        self.router = router
        self.output = view
    }
    
    func back() {
        
    }
}
