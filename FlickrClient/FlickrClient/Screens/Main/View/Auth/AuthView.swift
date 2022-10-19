//
//  AuthView.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 18.10.2022.
//

import UIKit

//class AuthView: UIView {
//    var email : String?
//    
//    var password : String?
//    
//    lazy var emailTextField = UITextField()
//    lazy var passwordTextField = UITextField() 
//    
//     lazy var signInButton = UIButton()
//     lazy var signUpButton = UIButton()
//    private lazy var label = UILabel()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        email = emailTextField.text
//        password = passwordTextField.text
//        
//        backgroundColor = .white
//        configureLabel()
//        configureEmailField()
//        configurePasswordField()
//        configureSignInButton()
//        configureSignUpButton()
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configureLabel() {
//        addSubview(label)
//        label.text = "Welcome!"
//        label.font = UIFont(name: "Helvetica", size: 50)
//        label.textColor = .black
//        label.textAlignment = .center
//        label.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().offset(70)
//            make.width.equalToSuperview().offset(12)
//            make.height.equalTo(70)
//        }
//    }
//    
//    func configureEmailField() {
//        addSubview(emailTextField)
//        emailTextField.placeholder = "   Type email"
//        emailTextField.layer.borderWidth = 1.5
//        emailTextField.layer.borderColor = UIColor(hexString: "#bae4e5").withAlphaComponent(0.3).cgColor
//        emailTextField.autocapitalizationType = .none
//        emailTextField.autocorrectionType = .no
//        emailTextField.snp.makeConstraints { make in
//            make.top.equalTo(label.snp.bottom).offset(50)
//            make.width.equalToSuperview().offset(-25)
//            make.centerX.equalToSuperview()
//            make.height.equalTo(50)
//            
//        }
//    }
//    
//    func configurePasswordField() {
//        addSubview(passwordTextField)
//        passwordTextField.placeholder = "   Password"
//        passwordTextField.layer.borderWidth = 1.5
//        passwordTextField.layer.borderColor = UIColor(hexString: "#bae4e5").withAlphaComponent(0.3).cgColor
//        passwordTextField.isSecureTextEntry = true
//        
//        passwordTextField.snp.makeConstraints { make in
//            make.width.equalToSuperview().offset(-25)
//            make.centerX.equalToSuperview()
//            make.height.equalTo(50)
//            make.top.equalTo(emailTextField.snp.bottom).offset(16)
//        }
//    }
//    
//    func configureSignInButton() {
//        addSubview(signInButton)
//        signInButton.layer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 25, height: 30)
//        signInButton.setTitle("Sign In", for: .normal)
//        signInButton.backgroundColor = UIColor(hexString: "#bae4e5")
//        signInButton.layer.cornerRadius = 15
//        signInButton.clipsToBounds = true
//        signInButton.setTitleColor(UIColor(hexString: "#284387"), for: .normal)
//        
//        signInButton.snp.makeConstraints { make in
//            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
//            make.width.equalToSuperview().offset(-25)
//            make.centerX.equalToSuperview()
//            make.height.equalTo(50)
//        }
//    }
//    
//    func configureSignUpButton() {
//        addSubview(signUpButton)
//        signUpButton.layer.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
//        signUpButton.setTitle("Sign Up", for: .normal)
//        signUpButton.setTitleColor(.black, for: .normal)
//        signUpButton.snp.makeConstraints { make in
//            make.top.equalTo(signInButton.snp.bottom).offset(16)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(70)
//            make.height.equalTo(30)
//        }
//    }
//    
//    
//}
