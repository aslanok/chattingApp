//
//  MessagesLoadUseCase.swift
//  chattingApp
//
//  Created by MacBook on 1.03.2023.
//

import UIKit
import Firebase

protocol MessagesLoadUseCaseInput{
    func execute()
}

protocol MessagesLoadUseCaseOutput {
    func setMessagesLoadSuccess(list : [Message])
    func setMessagesLoadFailed(errorMessage : String)
}

class MessagesLoadUseCase : MessagesLoadUseCaseInput {
    internal var output : MessagesLoadUseCaseOutput?
    
    let db = Firestore.firestore()
    var messageList : [Message] = [Message]()
    
    func execute() {
        db.collection(FirebaseConstants.collectionName)
            .order(by: FirebaseConstants.dateField)
            .addSnapshotListener { (querySnapshot, error) in
            self.messageList = []
            if let e = error {
                self.output?.setMessagesLoadFailed(errorMessage: e.localizedDescription)
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data[FirebaseConstants.senderField] as? String , let messageBody = data[FirebaseConstants.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messageList.append(newMessage)
                        }
                    }
                    self.output?.setMessagesLoadSuccess(list: self.messageList)
                } else {
                    self.output?.setMessagesLoadFailed(errorMessage: error?.localizedDescription ?? " hata ")
                }
            }
        }
    }
}
