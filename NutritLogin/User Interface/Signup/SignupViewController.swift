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
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardType = .emailAddress
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return passwordTextField
    }()
    
    lazy var repeatPasswordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Repeat Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.isSecureTextEntry = true
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
    
    lazy var termsAndConditionsButton: UIButton = {
     let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        //button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(buttonSelected), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    lazy var signUpButton: UIButton = {
        let signUp = UIButton()
        signUp.setTitle("Sign Up", for: .normal)
        signUp.setTitleColor(.white, for: .normal)
        signUp.backgroundColor = #colorLiteral(red: 0.1105268672, green: 0.4639024138, blue: 0.8267809749, alpha: 1)
        signUp.layer.cornerRadius = 5
        signUp.addTarget(self, action: #selector(signUpDone), for: .touchUpInside)
        signUp.translatesAutoresizingMaskIntoConstraints = false
        return signUp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
    
        errorLabel.isHidden = true
        view.backgroundColor = #colorLiteral(red: 0.4040249884, green: 0.7187735438, blue: 0.9633027911, alpha: 1)
        setupLayout()
    }
    
    @objc func buttonSelected() {
        
        termsAndConditionsButton.backgroundColor = .gray
        print("acepto!")
    }
    @objc func signUpDone() {
        
        guard let userEmail = signUpTextField.text, signUpTextField.text?.characters.count != 0 else {
            
            errorLabel.isHidden = false
            errorLabel.textColor = .red
            errorLabel.text = "Please enter an Email."
            //displayMyAlertMessage(userMessage: "Please enter an Email.")
            return
        }
        
        guard let userPassword = passwordTextField.text, (passwordTextField.text?.characters.count)! >= 6 else {
            
            errorLabel.isHidden = false
            errorLabel.textColor = .red
            errorLabel.text = "The password should contain between 6 and 20 characters"
            return
        }
        
        let repeatPassword = repeatPasswordTextField.text
        
        if isValidEmail(emailID: userEmail) == true && (repeatPassword == userPassword) {
            displayMyAlertMessage(userMessage: "Registration successful. Thank you!")
            
        } else {
            
            errorLabel.isHidden = false
            errorLabel.textColor = .red
            errorLabel.text = "Please enter a valid email or check your confirm password."
            
        }
    
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        UserDefaults.standard.synchronize()
    }
    
    private func setupLayout() {
        view.addSubview(logoimageView)
        view.addSubview(errorLabel)
        view.addSubview(signUpTextField)
        view.addSubview(passwordTextField)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(termsAndConditionsButton)
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
        
        termsAndConditionsButton.centerYAnchor.constraint(equalTo: termsAndConditionsLabel.centerYAnchor).isActive = true
        termsAndConditionsButton.leadingAnchor.constraint(equalTo: repeatPasswordTextField.leadingAnchor).isActive = true
        termsAndConditionsButton.heightAnchor.constraint(equalToConstant: 10).isActive = true
        termsAndConditionsButton.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        termsAndConditionsLabel.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 20).isActive = true
        termsAndConditionsLabel.leadingAnchor.constraint(equalTo: termsAndConditionsButton.leadingAnchor, constant: 12).isActive = true
        termsAndConditionsLabel.trailingAnchor.constraint(equalTo: repeatPasswordTextField.trailingAnchor, constant: 10).isActive = true
        
        signUpButton.topAnchor.constraint(equalTo: termsAndConditionsLabel.bottomAnchor, constant: 20).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: termsAndConditionsLabel.leadingAnchor).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
    }
    
    func isValidEmail(emailID:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
    
    private func displayMyAlertMessage(userMessage: String) {
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            let loginViewController = LoginViewController()
            
            self.navigationController?.pushViewController(loginViewController, animated: true)
        })
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
        
    }
    
}

extension SignupViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
