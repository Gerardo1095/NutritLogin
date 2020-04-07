//
//  SignupViewController.swift
//  NutritLogin
//
//  Created by Gerardo Mendoza Avas on 06/04/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    lazy var logoimageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo-nutrit")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var errorLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.text = "The password should contain between 6 and 20 characters"
        errorLabel.textColor = .white
        errorLabel.adjustsFontSizeToFitWidth = true
        errorLabel.numberOfLines = 2
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return errorLabel
    }()
    
    lazy var signUpTextField: UITextField = {
        let signUpTextField = UITextField()
        signUpTextField.placeholder = "Email"
        signUpTextField.backgroundColor = .white
        signUpTextField.keyboardType = .emailAddress
        signUpTextField.borderStyle = .roundedRect
        signUpTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return signUpTextField
    }()
    
    lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.keyboardType = .emailAddress
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return passwordTextField
    }()
    
    lazy var repeatPasswordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Repeat Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.keyboardType = .emailAddress
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return passwordTextField
    }()
    
    lazy var termsAndConditionsLabel: UILabel = {
        let Label = UILabel()
        Label.text = "I have read and agree the terms of service"
        Label.textColor = .white
        Label.font = UIFont(name: Label.font.fontName, size: 15)
        Label.numberOfLines = 2
        Label.translatesAutoresizingMaskIntoConstraints = false
        return Label
    }()
    
    /*lazy var termsAndConditionsButton: UIButton = {
     let button = UIButton()
     button.setTitle("Terms of service", for: .normal)
     button.setTitleColor(.white, for: .normal)
     button.titleLabel?.font = UIFont(name: "", size: 5)
     button.translatesAutoresizingMaskIntoConstraints = false
     return button
     }()
     */
    
    lazy var signUpButton: UIButton = {
        let signUp = UIButton()
        signUp.setTitle("Sign Up", for: .normal)
        signUp.setTitleColor(.white, for: .normal)
        signUp.backgroundColor = #colorLiteral(red: 0.1105268672, green: 0.4639024138, blue: 0.8267809749, alpha: 1)
        signUp.layer.cornerRadius = 5
        //signUp.addTarget(self, action: #selector(signUpDone), for: .touchUpInside)
        signUp.translatesAutoresizingMaskIntoConstraints = false
        return signUp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.4040249884, green: 0.7187735438, blue: 0.9633027911, alpha: 1)
        setupLayout()
    }
    
    /*@objc func signUpDone() {
        let registered = RegisteredViewController()
        navigationController?.pushViewController(registered, animated: true)
    }*/
    
    func setupLayout() {
        view.addSubview(logoimageView)
        view.addSubview(errorLabel)
        view.addSubview(signUpTextField)
        view.addSubview(passwordTextField)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(termsAndConditionsLabel)
        view.addSubview(signUpButton)
        
        logoimageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        logoimageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoimageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        logoimageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        errorLabel.topAnchor.constraint(equalTo: logoimageView.bottomAnchor, constant: 20).isActive = true
        errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        signUpTextField.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 10).isActive = true
        signUpTextField.trailingAnchor.constraint(equalTo: errorLabel.trailingAnchor).isActive = true
        signUpTextField.leadingAnchor.constraint(equalTo: errorLabel.leadingAnchor).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: signUpTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: signUpTextField.trailingAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: signUpTextField.leadingAnchor).isActive = true
        
        repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        repeatPasswordTextField.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        repeatPasswordTextField.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        
        termsAndConditionsLabel.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 20).isActive = true
        termsAndConditionsLabel.leadingAnchor.constraint(equalTo: repeatPasswordTextField.leadingAnchor).isActive = true
        termsAndConditionsLabel.trailingAnchor.constraint(equalTo: repeatPasswordTextField.trailingAnchor, constant: 10).isActive = true
        
        signUpButton.topAnchor.constraint(equalTo: termsAndConditionsLabel.bottomAnchor, constant: 20).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: termsAndConditionsLabel.leadingAnchor).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
    }

}
