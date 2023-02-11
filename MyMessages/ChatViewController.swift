//
//  ChatViewController.swift
//  MyMessages
//
//  Created by Mina on 09/02/2023.
//

import UIKit
import MessageKit

struct Sender : SenderType {
        var senderId: String
        var displayName: String
    
}
struct Message: MessageType {
    var sender: MessageKit.SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKit.MessageKind
    
    
}
class ChatViewController: MessagesViewController , MessagesDataSource ,MessagesLayoutDelegate , MessagesDisplayDelegate{
    
    let currentUser = Sender(senderId: "self", displayName: "iOS Academy")
    let othertUser = Sender(senderId: "other", displayName: "Mina Eid")
    
    var messages = [MessageType]()
    override func viewDidLoad() {
        super.viewDidLoad()
        messages.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-86400), kind: .text("Hello world")))
        messages.append(Message(sender: othertUser, messageId: "2", sentDate: Date().addingTimeInterval(-70000), kind: .text("How is goind")))
        messages.append(Message(sender: currentUser, messageId: "3", sentDate: Date().addingTimeInterval(-56400), kind: .text("Here is a long reply.Here is a long reply.Here is a long reply.Here is a long reply")))
        messages.append(Message(sender: othertUser, messageId: "4", sentDate: Date().addingTimeInterval(-46400), kind: .text("Look it works")))
        messages.append(Message(sender: currentUser, messageId: "5", sentDate: Date().addingTimeInterval(-26400), kind: .text("I Love Making Apps.I Love Making Apps.I Love Making Apps.I Love Making Apps")))
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
    }
    func currentSender() -> MessageKit.SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
    

    
    
    
    

   

}
