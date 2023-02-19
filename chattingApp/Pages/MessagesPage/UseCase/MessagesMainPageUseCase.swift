//
//  MessagesMainPageUseCase.swift
//  chattingApp
//
//  Created by MacBook on 20.02.2023.
//

import UIKit
import Firebase

protocol MessagesMainPageUseCaseInput {
    func execute()
}

protocol MessagesMainPageUseCaseOutput {
    func setLogOutSuccess()
    func setLogOutFailed(errorMessage : String)
}

class MessagesMainPageUseCase : MessagesMainPageUseCaseInput {
    internal var output : MessagesMainPageUseCaseOutput?
    
    func execute() {
        do {
            try Auth.auth().signOut()
            self.output?.setLogOutSuccess()
        } catch let signOutError as NSError {
            self.output?.setLogOutFailed(errorMessage: signOutError.localizedDescription)
        }
    }
    
}
