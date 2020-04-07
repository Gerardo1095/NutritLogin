//
//  StartedSessionViewController.swift
//  NutritLogin
//
//  Created by Gerardo Mendoza Avas on 06/04/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import UIKit

class StartedSessionViewController: UIViewController {

    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Bienvenido a Nutrit!"
        label.textColor = .black
        //label.font = UIFont(name: "Avenir-Light", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}
