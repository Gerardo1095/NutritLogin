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
    
    private lazy var logoimageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo-nutrit")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var alertLabel: UILabel = {
        let label = UILabel()
        label.text = "The password should contain between 6 and 20 characters"
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signUpTextField: UITextField = {
        let signUpTextField = UITextField()
        signUpTextField.placeholder = "Email"
        signUpTextField.backgroundColor = .white
        signUpTextField.keyboardType = .emailAddress
        signUpTextField.borderStyle = .roundedRect
        signUpTextField.delegate = self
        signUpTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return signUpTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
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
    
    private lazy var repeatPasswordTextField: UITextField = {
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
    
    private lazy var termsAndConditionsLabel: UILabel = {
        let label = UILabel()
        label.text = "I have read and agree the terms of service"
        label.textColor = .white
        label.font = UIFont(name: label.font.fontName, size: 15)
        label.numberOfLines = 2
        let tap = UITapGestureRecognizer(target: self, action: #selector(gestureRecognizerButtonPressed))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var termsAndConditionsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let signUp = UIButton()
        signUp.setTitle("Sign Up", for: .normal)
        signUp.setTitleColor(.white, for: .normal)
        signUp.backgroundColor = #colorLiteral(red: 0.1105268672, green: 0.4639024138, blue: 0.8267809749, alpha: 1)
        signUp.isEnabled = false
        signUp.alpha = 0.30
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
    
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.frame = frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    //MARK: Actions
    @objc private func gestureRecognizerButtonPressed() {
        termsAndConditionsButton.backgroundColor = .black
        signUpButton.isEnabled = true
        signUpButton.alpha = 1.0
    }
    
    @objc private func signUpButtonPressed() {
        delegate?.signUpView(self, signUpPressed: signUpButton, user: signUpTextField.text, password: passwordTextField.text, repeatedPassword: repeatPasswordTextField.text)
    }
    
    @objc private func termsAndConditionsButtonPressed() {
        delegate?.signUpView(self, termsAndConditionsPressed: termsAndConditionsButton)
    }
    
    @objc private func termsAndConditionsLabelTapped() {
        delegate?.signUpView(self, termsAndConditionsTapped: termsAndConditionsLabel)
    }
    
}

//MARK: UITextfieldDelegate
extension SignUpView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -15, up: true)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -15, up: false)
    }
}
