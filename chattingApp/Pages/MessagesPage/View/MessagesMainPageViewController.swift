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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ChatAppColor.viewBackgroundColor
        
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(logOutButton)
        logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        logOutButton.topAnchor.constraint(equalTo: backButton.topAnchor).isActive = true
        logOutButton.bottomAnchor.constraint(equalTo: backButton.bottomAnchor).isActive = true
        
    }
    
    @objc func logOutButtonClicked(){
        presenter?.loggingOut()
    }
    
    @objc func backButtonClicked(){
        presenter?.back()
    }
    
}
