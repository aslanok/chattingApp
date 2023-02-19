//
//  MessagesMainPagePresenter.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

protocol MessagesMainPagePresentation{
    func back()
    func loggingOut()
}

class MessagesMainPagePresenter: MessagesMainPagePresentation, MessagesMainPageUseCaseOutput{
    
    private var messagesMainPageUseCase : MessagesMainPageUseCaseInput
    let router : MessagesMainPageRouting
    internal var output : MessagesMainPageViewContract
    
    init(router : MessagesMainPageRouting, view : MessagesMainPageViewContract, messagesMainPageCase: MessagesMainPageUseCaseInput) {
        self.router = router
        self.output = view
        self.messagesMainPageUseCase = messagesMainPageCase
    }
    
    func loggingOut() {
        messagesMainPageUseCase.execute()
    }
    
    func setLogOutSuccess() {
        print("logOutSuccess")
        router.backToHome(from: output)
    }
    
    func setLogOutFailed(errorMessage: String) {
        print("logOut Failed")
    }
    
    func back() {
        router.back(from: output)
    }
}
