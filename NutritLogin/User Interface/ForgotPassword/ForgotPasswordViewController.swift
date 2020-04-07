//
//  ForgotPasswordViewController.swift
//  NutritLogin
//
//  Created by Gerardo Mendoza Avas on 06/04/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    lazy var logoimageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "password-recovery")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var alertMessage: UILabel = {
        let message = UILabel()
        message.text = "Write down the email address associated with your account."
        message.textColor = .white
        message.textAlignment = .center
        message.numberOfLines = 2
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.placeholder = "Email"
        email.backgroundColor = .white
        email.keyboardType = .emailAddress
        email.borderStyle = .roundedRect
        email.translatesAutoresizingMaskIntoConstraints = false
        
        return email
    }()
    
    lazy var sendEmailButton: UIButton = {
        let sendEmail = UIButton()
        sendEmail.setTitle("SEND EMAIL", for: .normal)
        sendEmail.setTitleColor(.white, for: .normal)
        sendEmail.backgroundColor = #colorLiteral(red: 0.1105268672, green: 0.4639024138, blue: 0.8267809749, alpha: 1)
        sendEmail.layer.cornerRadius = 5
        sendEmail.translatesAutoresizingMaskIntoConstraints = false
        return sendEmail
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.4040249884, green: 0.7187735438, blue: 0.9633027911, alpha: 1)
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(logoimageView)
        view.addSubview(alertMessage)
        view.addSubview(emailTextField)
        view.addSubview(sendEmailButton)
        
        logoimageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        logoimageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoimageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        logoimageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        alertMessage.topAnchor.constraint(equalTo: logoimageView.bottomAnchor, constant: 20).isActive = true
        alertMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        alertMessage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        /*alertMessage.topAnchor.constraint(equalTo: logoimageView.bottomAnchor, constant: 50).isActive = true
        alertMessage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        alertMessage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        alertMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        */
        emailTextField.topAnchor.constraint(equalTo: alertMessage.bottomAnchor, constant: 10).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: alertMessage.leadingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: alertMessage.trailingAnchor).isActive = true
        
        sendEmailButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        sendEmailButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        sendEmailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    

}
