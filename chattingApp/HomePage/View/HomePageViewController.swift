//
//  HomePageViewController.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

protocol HomePageViewContract : UIViewController {
    
}

class HomePageViewController : UIViewController, HomePageViewContract{
    
    var presenter : HomePagePresentation?
    
    private lazy var logInButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .ChatAppColor.blue100
        button.setTitle("Giriş Yap", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(logInButtonClicked), for: .touchUpInside)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var registerButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .ChatAppColor.blue100
        button.setTitle("Kayıt Ol", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var appNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My Chatting App"
        //label.font = UIFont.systemFont(ofSize: 16)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("page open")
        view.backgroundColor = .ChatAppColor.viewBackgroundColor
        
        view.addSubview(appNameLabel)
        appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        
        view.addSubview(logInButton)
        logInButton.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor , constant: 200).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(registerButton)
        registerButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 20).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: logInButton.leadingAnchor).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: logInButton.trailingAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func logInButtonClicked(){
        print("login")
    }
    
    @objc func registerButtonClicked(){
        print("register")
    }
    
}
