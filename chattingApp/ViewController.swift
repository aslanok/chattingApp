//
//  ViewController.swift
//  chattingApp
//
//  Created by MacBook on 19.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "project started"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // Do any additional setup after loading the view.
    }


}

