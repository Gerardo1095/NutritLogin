//
//  LoginViewController.swift
//  NutritLogin
//
//  Created by Gerardo Mendoza Avas on 06/04/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //Lets Objects to create the UI
    lazy var logoimageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo-nutrit")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var alertLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.text = "The email is required"
        errorLabel.textColor = .red
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return errorLabel
    }()
    
    lazy var loginTextField: UITextField = {
        let logingTextField = UITextField()
        logingTextField.placeholder = "Usuario"
        logingTextField.backgroundColor = .white
        logingTextField.keyboardType = .emailAddress
        logingTextField.borderStyle = .roundedRect
        logingTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return logingTextField
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
    
    lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Loging", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = #colorLiteral(red: 0.1105268672, green: 0.4639024138, blue: 0.8267809749, alpha: 1)
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: #selector(logingNow), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    lazy var signUpButton: UIButton = {
        let signUp = UIButton()
        signUp.setTitle("Sign Up!", for: .normal)
        signUp.setTitleColor(.white, for: .normal)
        signUp.translatesAutoresizingMaskIntoConstraints = false
        signUp.addTarget(self, action: #selector(signUpNow), for: .touchUpInside)
        return signUp
    }()
    
    lazy var forgotButton: UIButton = {
        let forgot = UIButton()
        forgot.setTitle("Forgot Password?", for: .normal)
        forgot.setTitleColor(.white, for: .normal)
        forgot.addTarget(self, action: #selector(forgotPassword), for: .touchUpInside)
        forgot.translatesAutoresizingMaskIntoConstraints = false
        return forgot
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.4040249884, green: 0.7187735438, blue: 0.9633027911, alpha: 1)
        setupLayout()
    }
    
    @objc func logingNow() {
        let loging = StartedSessionViewController()
        navigationController?.pushViewController(loging, animated: true)
    }
    
    @objc func signUpNow() {
        let signUp = SignupViewController()
        navigationController?.pushViewController(signUp, animated: true)
        
    }
    
    @objc func forgotPassword() {
        let forgot = ForgotPasswordViewController()
        
        navigationController?.pushViewController(forgot, animated: true)
        
    }
    
    func setupLayout() {
        view.addSubview(logoimageView)
        view.addSubview(alertLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        view.addSubview(forgotButton)
        
        logoimageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        logoimageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //logoimageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoimageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        logoimageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        alertLabel.topAnchor.constraint(equalTo: logoimageView.bottomAnchor, constant: 50).isActive = true
        alertLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        alertLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        alertLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        loginTextField.topAnchor.constraint(equalTo: alertLabel.bottomAnchor, constant: 10).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: alertLabel.leadingAnchor).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: alertLabel.trailingAnchor).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40)
        
        signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 7).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor).isActive = true
        
        forgotButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 7).isActive = true
        forgotButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor).isActive = true
        
    }
    
}
