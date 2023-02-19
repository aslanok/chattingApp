//
//  LoginPagePresentation.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

protocol LoginPagePresentation {
    func back()
    func logInCheck(email : String, password: String)
}
