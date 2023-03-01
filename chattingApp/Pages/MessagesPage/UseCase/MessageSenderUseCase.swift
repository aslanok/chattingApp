//
//  MessageSenderUseCase.swift
//  chattingApp
//
//  Created by MacBook on 1.03.2023.
//

import UIKit
import Firebase

protocol MessageSenderUseCaseInput {
    func execute(messageBody : String)
}

protocol MessageSenderUseCaseOutput {
    func setMessageSendSuccess()
    func setMessageSendFailed(errorMessage : String)
}

class MessageSenderUseCase : MessageSenderUseCaseInput {
    internal var output : MessageSenderUseCaseOutput?
    
    let db = Firestore.firestore()
    
    func execute(messageBody: String) {
        if let messageSender = Auth.auth().currentUser?.email {
            db.collection(FirebaseConstants.collectionName).addDocument(data: [
                FirebaseConstants.senderField : messageSender,
                FirebaseConstants.bodyField : messageBody,
                FirebaseConstants.dateField : Date().timeIntervalSince1970
            ]) { error in
                if let e = error {
                    self.output?.setMessageSendFailed(errorMessage: e.localizedDescription)
                } else {
                    self.output?.setMessageSendSuccess()
                }
            }
        }
        
    }
    
}
