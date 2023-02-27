//
//  MessagesViewController.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

protocol MessagesMainPageViewContract : UIViewController {
    
}

class MessagesMainPageViewController : UIViewController,MessagesMainPageViewContract , UITableViewDelegate, UITableViewDataSource {
    
    internal var presenter : MessagesMainPagePresentation?
    
    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var logOutButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Çıkış Yap", for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(logOutButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: "messageCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ChatAppColor.viewBackgroundColor
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(logOutButton)
        logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        logOutButton.topAnchor.constraint(equalTo: backButton.topAnchor).isActive = true
        logOutButton.bottomAnchor.constraint(equalTo: backButton.bottomAnchor).isActive = true
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
    }
    
    @objc func logOutButtonClicked(){
        presenter?.loggingOut()
    }
    
    @objc func backButtonClicked(){
        presenter?.back()
    }
    
}
