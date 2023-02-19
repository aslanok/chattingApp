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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
}
