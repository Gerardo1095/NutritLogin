//
//  SignupView.swift
//  NutritLogin
//
//  Created by Gerardo Mendoza Avas on 15/04/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import UIKit

protocol SignUpViewDelegate: AnyObject {
    func signUpView(_ view: SignUpView, signUpPressed button: UIButton, user: String?, password: String?, repeatedPassword: String?)
    func signUpView(_ view: SignUpView, termsAndConditionsPressed button: UIButton)
    func signUpView(_ view: SignUpView, termsAndConditionsTapped label: UILabel)
}

final class SignUpView: UIView {
    
    //MARK: Variables and Constants
    weak var delegate: SignUpViewDelegate?
    
    lazy var logoimageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo-nutrit")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var alertLabel: UILabel = {
        let label = UILabel()
        label.text = "The password should contain between 6 and 20 characters"
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var signUpTextField: UITextField = {
        let signUpTextField = UITextField()
        signUpTextField.placeholder = "Email"
        signUpTextField.backgroundColor = .white
        signUpTextField.keyboardType = .emailAddress
        signUpTextField.borderStyle = .roundedRect
        signUpTextField.delegate = self
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
        passwordTextField.delegate = self
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
        passwordTextField.delegate = self
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return passwordTextField
    }()
    
    lazy var termsAndConditionsLabel: UILabel = {
        let Label = UILabel()
        Label.text = "I have read and agree the terms of service"
        Label.textColor = .white
        Label.font = UIFont(name: Label.font.fontName, size: 15)
        Label.numberOfLines = 2
        Label.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(gestureRecognizerLabelTapped)))
        Label.translatesAutoresizingMaskIntoConstraints = false
        return Label
    }()
    
    lazy var termsAndConditionsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 2
        button.layer.borderWidth = 5
        //button.addTarget(self, action: #selector(termsAndConditionsButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let signUp = UIButton()
        signUp.setTitle("Sign Up", for: .normal)
        signUp.setTitleColor(.white, for: .normal)
        signUp.backgroundColor = #colorLiteral(red: 0.1105268672, green: 0.4639024138, blue: 0.8267809749, alpha: 1)
        signUp.layer.cornerRadius = 5
        signUp.isEnabled = true
        //signUp.alpha = 0.30
        signUp.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        signUp.translatesAutoresizingMaskIntoConstraints = false
        return signUp
    }()
    
    //MARK: view life Cycle
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: Functions
    
    private func setupLayout() {
        backgroundColor = #colorLiteral(red: 0.4040249884, green: 0.7187735438, blue: 0.9633027911, alpha: 1)
        
        addSubview(logoimageView)
        addSubview(alertLabel)
        addSubview(signUpTextField)
        addSubview(passwordTextField)
        addSubview(repeatPasswordTextField)
        addSubview(termsAndConditionsButton)
        addSubview(termsAndConditionsLabel)
        addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            logoimageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30) ,
            logoimageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoimageView.heightAnchor.constraint(equalToConstant: 180),
            logoimageView.widthAnchor.constraint(equalToConstant: 180),
            
            alertLabel.topAnchor.constraint(equalTo: logoimageView.bottomAnchor, constant: 20),
            alertLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            alertLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            signUpTextField.topAnchor.constraint(equalTo: alertLabel.bottomAnchor, constant: 10),
            signUpTextField.trailingAnchor.constraint(equalTo: alertLabel.trailingAnchor),
            signUpTextField.leadingAnchor.constraint(equalTo: alertLabel.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: signUpTextField.bottomAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: signUpTextField.trailingAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: signUpTextField.leadingAnchor),
            
            repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            repeatPasswordTextField.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            repeatPasswordTextField.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            
            termsAndConditionsButton.centerYAnchor.constraint(equalTo: termsAndConditionsLabel.centerYAnchor),
            termsAndConditionsButton.leadingAnchor.constraint(equalTo: repeatPasswordTextField.leadingAnchor),
            termsAndConditionsButton.heightAnchor.constraint(equalToConstant: 10),
            termsAndConditionsButton.widthAnchor.constraint(equalToConstant: 10),
            
            termsAndConditionsLabel.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 20),
            termsAndConditionsLabel.leadingAnchor.constraint(equalTo: termsAndConditionsButton.leadingAnchor, constant: 12),
            termsAndConditionsLabel.trailingAnchor.constraint(equalTo: repeatPasswordTextField.trailingAnchor, constant: 10),
            
            signUpButton.topAnchor.constraint(equalTo: termsAndConditionsLabel.bottomAnchor, constant: 20),
            signUpButton.leadingAnchor.constraint(equalTo: termsAndConditionsLabel.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            ])
        
    }
    
    private func isValidEmail(emailID:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
    
    func displayErrorMessage(_ message: String) {
        alertLabel.text = message
    }
    
    /*private func displayMyAlertMessage(userMessage: String) {
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            let loginViewController = LoginViewController()
            
            self.navigationController?.popViewController(animated: true)
        })
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
        
    }*/
    
    //MARK: Actions
    @objc func gestureRecognizerButtonPressed() {
        
        termsAndConditionsButton.backgroundColor = .black
        signUpButton.isEnabled = true
        signUpButton.alpha = 1.0
        print("Estoy presionando mi label")
    }
    
    @objc func gestureRecognizerLabelTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(gestureRecognizerButtonPressed))
        termsAndConditionsLabel.isUserInteractionEnabled = true
        termsAndConditionsLabel.addGestureRecognizer(tap)
    }
    
    /*@objc func signUpButtonPressed() {
        
        guard let userEmail = signUpTextField.text, signUpTextField.text?.characters.count != 0 else {
            
            alertLabel.textColor = .red
            alertLabel.text = "Please enter an Email."
            //displayMyAlertMessage(userMessage: "Please enter an Email.")
            return
        }
        
        guard let userPassword = passwordTextField.text, (passwordTextField.text?.characters.count)! >= 6 else {
            
            
            alertLabel.textColor = .red
            alertLabel.text = "The password should contain between 6 and 20 characters"
            return
        }
        
        let repeatPassword = repeatPasswordTextField.text
        
        if isValidEmail(emailID: userEmail) == true {
            
            if (repeatPassword == userPassword) {
            } else {
                alertLabel.textColor = .red
                alertLabel.text = "The passwords do not match"
            }
            
        } else {
            alertLabel.textColor = .red
            alertLabel.text = "You need a valid email"
            
        }
        
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        UserDefaults.standard.synchronize()
    }*/
    
    @objc func signUpButtonPressed() {
        delegate?.signUpView(self, signUpPressed: signUpButton, user: signUpTextField.text, password: passwordTextField.text, repeatedPassword: repeatPasswordTextField.text)
        print("estoy funcionando")
    }
    
    @objc func termsAndConditionsButtonPressed() {
        delegate?.signUpView(self, termsAndConditionsPressed: termsAndConditionsButton)
    }
    
    @objc func termsAndConditionsLabelTapped() {
        delegate?.signUpView(self, termsAndConditionsTapped: termsAndConditionsLabel)
    }
    
}

//MARK: UITextfieldDelegate
extension SignUpView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
