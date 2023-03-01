//
//  MessagesMainPagePresenter.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

protocol MessagesMainPagePresentation{
    func back()
    func loadMessages()
    func messageSend(messageText : String)
    func loggingOut()
}

class MessagesMainPagePresenter: MessagesMainPagePresentation, MessagesMainPageUseCaseOutput, MessageSenderUseCaseOutput, MessagesLoadUseCaseOutput{
    
    private var messagesMainPageUseCase : MessagesMainPageUseCaseInput
    private var messageSenderUseCase : MessageSenderUseCaseInput
    private var messagesLoadUseCase : MessagesLoadUseCaseInput
    
    let router : MessagesMainPageRouting
    internal var output : MessagesMainPageViewContract
    
    init(router : MessagesMainPageRouting, view : MessagesMainPageViewContract, messagesMainPageCase: MessagesMainPageUseCaseInput, messageSenderCase : MessageSenderUseCaseInput, messagesLoadCase : MessagesLoadUseCaseInput) {
        self.router = router
        self.output = view
        self.messagesMainPageUseCase = messagesMainPageCase
        self.messageSenderUseCase = messageSenderCase
        self.messagesLoadUseCase = messagesLoadCase
    }
    
    func loadMessages() {
        messagesLoadUseCase.execute()
    }
    
    func messageSend(messageText: String) {
        messageSenderUseCase.execute(messageBody: messageText)
    }
    
    func setMessageSendSuccess() {
        print("message send successfull")
    }
    
    func setMessageSendFailed(errorMessage: String) {
        print("error var : \(errorMessage)")
    }
    
    func setMessagesLoadSuccess(list : [Message]) {
        output.displayMessageList(list: list)
    }
    
    func setMessagesLoadFailed(errorMessage: String) {
        
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
