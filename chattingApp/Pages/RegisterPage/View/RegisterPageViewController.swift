//
//  RegisterPageViewController.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

class RegisterPageViewController : UIViewController, RegisterPageViewContract, UITextFieldDelegate {
    
    var presenter : RegisterPagePresentation?
    
    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var headerLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kayıt Ol"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var emailTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.backgroundColor = .white
        textField.placeholder = "Email Adresinizi giriniz"
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    
    private lazy var passwordTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.backgroundColor = .white
        textField.placeholder = "Şifrenizi giriniz"
        textField.isSecureTextEntry = true
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    
    private lazy var registerButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Kayıt Ol", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ChatAppColor.viewBackgroundColor

        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        view.addSubview(headerLabel)
        headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(backButton)
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backButton.topAnchor.constraint(equalTo: headerLabel.topAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: headerLabel.bottomAnchor).isActive = true
        
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 50).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(registerButton)
        registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func registerCompleted() {
        let alertController = UIAlertController(title: "Kaydetme işlemi", message: "Kaydetme işlemi başarıyla tamamlandı", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.presenter?.back()
        }
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true, completion: nil)

    }
    
    func registerFailed() {
        let alert = UIAlertController(title: "Kaydetme işlemi", message: "Kaydetme işlemi başarısız. Tekrar Deneyiniz", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @objc func registerButtonClicked(){
        presenter?.createUser(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @objc func backButtonClicked(){
        presenter?.back()
    }
    
}
