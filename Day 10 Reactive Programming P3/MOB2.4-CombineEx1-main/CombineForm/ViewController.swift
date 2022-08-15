//
//  ViewController.swift
//  CombineForm
//
//  Created by Adriana González Martínez on 2/21/21.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @Published var emailValue: String = ""
    @Published var passwordValue: String = ""
    @Published var confirmPassValue: String = ""
    
    private var cancellableSet: Set<AnyCancellable> = []

    
    let emailTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = "Enter your email"
        txt.autocapitalizationType = .none
        return txt
    }()
    
    let passwordTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = "Choose your password"
        txt.autocapitalizationType = .none
        return txt
    }()
    
    let confirmPasswordTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = "Confirm your password"
        txt.autocapitalizationType = .none
        return txt
    }()
    
    let emailWarning: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemRed
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Minimum 3 characters required"
        return lbl
    }()
    
    let passwordWarning: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemRed
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Passwords must match and have at least 5 characters"
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let registerButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.darkGray, for: .normal)
        btn.setTitleColor(.lightGray, for: .disabled)
        btn.setTitle("Register", for: .normal)
        btn.isUserInteractionEnabled = true
        btn.addTarget(self, action: #selector(goRegister), for: .touchUpInside)
        return btn
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }()
    
    var validatedEmail: AnyPublisher<String?, Never> {
        return $emailValue.map { emailValue in
            guard emailValue.count > 2 else {
                DispatchQueue.main.async {
                    self.emailWarning.isHidden = false
                }
                return nil
            }
            self.emailWarning.isHidden = true
            return emailValue
        }.eraseToAnyPublisher()
    }
    
    var validatedPassword: AnyPublisher<String?, Never> {
        return Publishers.CombineLatest($passwordValue, $confirmPassValue)
            .receive(on: RunLoop.main)
            .map { passwordValue, confirmPassValue in
                guard confirmPassValue == passwordValue, passwordValue.count > 4 else {
                    self.passwordWarning.isHidden = false
                    return nil
                }
                self.passwordWarning.isHidden = true
                return passwordValue
            }.eraseToAnyPublisher()
    }
    
    var readyToSubmit: AnyPublisher<(String, String)?, Never> {
        return Publishers.CombineLatest(validatedPassword, validatedEmail)
            .map { passwordValue, emailValue in
                guard let realPassword = passwordValue, let realEmail = emailValue else {
                    return nil
                }
                return (realPassword, realEmail)
            }
            .eraseToAnyPublisher()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Welcome 🤓"
        setupStack()
        [emailTextField, passwordTextField, confirmPasswordTextField].forEach {
            $0.delegate = self
            $0.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: UIControl.Event.editingChanged)
        }
        
        self.readyToSubmit
            .map { return $0 != nil }
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: registerButton)
            .store(in: &cancellableSet)
        
    }
    
    func setupStack(){
        self.view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stack.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
        ])
        stack.addArrangedSubview(emailTextField)
        stack.addArrangedSubview(emailWarning)
        stack.addArrangedSubview(passwordTextField)
        stack.addArrangedSubview(confirmPasswordTextField)
        stack.addArrangedSubview(passwordWarning)
        stack.addArrangedSubview(registerButton)
    }
    
    @objc func goRegister(){
        let alert = UIAlertController(title: "Register", message: "Successful", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}

extension ViewController: UITextFieldDelegate{
    @objc func textFieldEditingDidChange(_ sender: UITextField) {
        switch sender {
        case emailTextField:
            emailValue = sender.text ?? ""
        case passwordTextField:
            passwordValue = sender.text ?? ""
        case confirmPasswordTextField:
            confirmPassValue = sender.text ?? ""
        default:
            break
        }
    }
}
