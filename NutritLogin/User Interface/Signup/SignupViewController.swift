//
//  SignupViewController.swift
//  NutritLogin
//
//  Created by Gerardo Mendoza Avas on 06/04/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import UIKit

final class SignupViewController: UIViewController {
    
    //MARK: Variables and Constants
    private let signUpView = SignUpView()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationItem()
        setUpView()
    }
    
    //MARK: Functions
    private func setUpNavigationItem() {
        navigationItem.title = "Sign up"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    
    private func setUpView() {
        signUpView.delegate = self
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpView)
        
        NSLayoutConstraint.activate([
            signUpView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            signUpView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            signUpView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            signUpView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    private func validateInputs(userName: String?, password: String?, repeatPassword: String?) -> Bool {
        if userName == "" {
            signUpView.displayErrorMessage("Please enter an Email")
            return false
        } else if !isValidEmail(userName!) {
            signUpView.displayErrorMessage("Invalid email")
            return false
        } else if password == "" {
            signUpView.displayErrorMessage("Please enter a password")
            return false
        } else if repeatPassword == "" {
            signUpView.displayErrorMessage("You need to verify your password")
            return false
        } else if password != repeatPassword {
            signUpView.displayErrorMessage("Passwords do not match")
            return false
        }
        
        return true
    }
    
    private func savingUser(user: String?, with password: String?) -> Bool {
        UserDefaults.standard.set(user, forKey: "userEmail")
        UserDefaults.standard.set(password, forKey: "userPassword")
        UserDefaults.standard.synchronize()
        return true
    }
    
    private func registerSucessFul() {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: SignUpViewDelegate
extension SignupViewController: SignUpViewDelegate {
    func signUpView(_ view: SignUpView, signUpPressed button: UIButton, user: String?, password: String?, repeatedPassword: String?) {
        if validateInputs(userName: user, password: password, repeatPassword: repeatedPassword) {
            guard savingUser(user: user, with: password) else {return}
            registerSucessFul()
        }
    }
    
    func signUpView(_ view: SignUpView, termsAndConditionsPressed button: UIButton) {
    }
    
    func signUpView(_ view: SignUpView, termsAndConditionsTapped label: UILabel) {
        
    }
}
