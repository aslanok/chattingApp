//
//  MessagesViewController.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

protocol MessagesMainPageViewContract : UIViewController {
    func displayMessageList(list : [Message])
}

class MessagesMainPageViewController : UIViewController,MessagesMainPageViewContract {
    
    internal var presenter : MessagesMainPagePresentation?
    
    var messages : [Message] = [Message]()
    
    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.backgroundColor = .ChatAppColor.purple100
        button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var logOutButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Çıkış Yap", for: .normal)
        button.backgroundColor = .ChatAppColor.purple100
        button.addTarget(self, action: #selector(logOutButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var bottomCardView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .ChatAppColor.purple100
        return view
    }()
    
    private lazy var messageTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter a message"
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = .black
        textField.setLeftPaddingPoints(10)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: "messageCell")
        return tableView
    }()
    
    private lazy var sendMessageButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("Send", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(messageSendClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ChatAppColor.pink100
        setUpView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter?.loadMessages()
        
    }

    func setUpView(){
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(logOutButton)
        logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        logOutButton.topAnchor.constraint(equalTo: backButton.topAnchor).isActive = true
        logOutButton.bottomAnchor.constraint(equalTo: backButton.bottomAnchor).isActive = true
        
        view.addSubview(bottomCardView)
        bottomCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomCardView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        bottomCardView.addSubview(messageTextField)
        messageTextField.topAnchor.constraint(equalTo: bottomCardView.topAnchor, constant: 10).isActive = true
        messageTextField.leadingAnchor.constraint(equalTo: bottomCardView.leadingAnchor, constant: 20).isActive = true
        messageTextField.trailingAnchor.constraint(equalTo: bottomCardView.trailingAnchor, constant: -80).isActive = true
        messageTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        bottomCardView.addSubview(sendMessageButton)
        sendMessageButton.centerYAnchor.constraint(equalTo: messageTextField.centerYAnchor).isActive = true
        sendMessageButton.trailingAnchor.constraint(equalTo: bottomCardView.trailingAnchor, constant: -20).isActive = true
        sendMessageButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        sendMessageButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomCardView.topAnchor).isActive = true
    }
    
    func displayMessageList(list: [Message]) {
        messages = list
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func messageSendClicked(){
        print("butona tıklandı")
        presenter?.messageSend(messageText: messageTextField.text ?? "bos mesaj")
    }
    
    @objc func logOutButtonClicked(){
        presenter?.loggingOut()
    }
    
    @objc func backButtonClicked(){
        presenter?.back()
    }
    
}

extension MessagesMainPageViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
        cell.setupCell(message: messages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 51
    }
}
