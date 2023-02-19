//
//  ViewController.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

class LoginViewController: UIViewController ,LoginPageViewContract {
    
    var presenter : LoginPagePresentation?
    
    private lazy var label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "project started"
        return label
    }()
    
    private lazy var nextPageButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sonraki Sayfaya Geçiniz", for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("viewUploaded")
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(nextPageButton)
        nextPageButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        nextPageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextPageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextPageButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    @objc func buttonClicked(){
        print("buttonClicked")
        presenter?.goOtherPage()
    }
    
    func display() {
        
    }


}

