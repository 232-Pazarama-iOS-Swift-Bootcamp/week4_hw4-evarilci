//
//  AuthViewController.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 18.10.2022.
//

import UIKit
import Firebase

final class AuthViewController: UIViewController {
    // MARK: - Properties
    private lazy var emailTextField = UITextField()
    private lazy var passwordTextField = UITextField()
    private lazy var signInButton = UIButton()
    private lazy var signUpButton = UIButton()
    private lazy var label = UILabel()
    
    // MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        let currentUser = Auth.auth().currentUser
        if currentUser != nil {
//            //let `self` = self
//            let HomeViewModel = HomeViewModel()
//            let HomeViewController = HomeViewController(viewModel: HomeViewModel)
//            let FavViewModel = FavViewModel()
//            let FavViewController = FavViewController(viewModel: FavViewModel)
//
//            let tabBarController = UITabBarController()
//            tabBarController.viewControllers = [HomeViewController, FavViewController]
//            self.navigationController?.pushViewController(tabBarController, animated: true)
            
            let tabBarViewController = TabBarViewController()
            tabBarViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.present(tabBarViewController, animated: true)
            
        }
        //view.backgroundColor = .white
        configureLabel()
        configureEmailField()
        configurePasswordField()
        configureSignInButton()
        configureSignUpButton()
        signInButton.addTarget(self, action: #selector(signInTapped(sender:)), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped(sender:)), for: .touchUpInside)
    }
    @objc func signInTapped(sender: UIButton) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, err in
                if err != nil  {
                    self.showAlert(title: "Error", message: err?.localizedDescription ?? "something went wrong")
                } else {
//                    let `self` = self
//                    let HomeViewModel = HomeViewModel()
//                    let HomeViewController = HomeViewController(viewModel: HomeViewModel)
//
//                    let tabBarController = UITabBarController()
//                    tabBarController.viewControllers = [HomeViewController]
//                    self.navigationController?.pushViewController(tabBarController, animated: true)
                    
                    //let `self` = self
                    let HomeViewModel = HomeViewModel()
                    let HomeViewController = HomeViewController(viewModel: HomeViewModel)
                    let FavViewModel = FavViewModel()
                    let FavViewController = FavViewController(viewModel: FavViewModel)
                    
                    let tabBarController = UITabBarController()
                    tabBarController.viewControllers = [HomeViewController, FavViewController]
                    self.navigationController?.pushViewController(tabBarController, animated: true)
                    
                }
                
            }
        } else {
            self.showAlert(title: "Error", message: "email/password can not be blank!")
        }
    }
    
    @objc func signUpTapped(sender: UIButton){
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, err in
                if err != nil {
                    self.showAlert(title: "Error", message: err?.localizedDescription ?? "Something went wrong")
                } else {
                    
//
//                    let `self` = self
//                    let HomeViewModel = HomeViewModel()
//                    let HomeViewController = HomeViewController(viewModel: HomeViewModel)
//
//                    let tabBarController = UITabBarController()
//                    tabBarController.viewControllers = [HomeViewController]
//                    self.navigationController?.pushViewController(tabBarController, animated: true)
                    
                    
                    //let `self` = self
                    let HomeViewModel = HomeViewModel()
                    let HomeViewController = HomeViewController(viewModel: HomeViewModel)
                    let FavViewModel = FavViewModel()
                    let FavViewController = FavViewController(viewModel: FavViewModel)
                    
                    let tabBarController = UITabBarController()
                    tabBarController.viewControllers = [HomeViewController, FavViewController]
                    self.navigationController?.pushViewController(tabBarController, animated: true)
                    
                    
                }
            }
        } else {
            
            self.showAlert(title: "Error", message: "email/password can not be blank!")
        }
    }
    
    // MARK: Layout configurations methods
    func configureLabel() {
        view.addSubview(label)
        label.text = "Welcome!"
        label.font = UIFont(name: "Helvetica", size: 50)
        label.textColor = .black
        label.textAlignment = .center
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(70)
            make.width.equalToSuperview().offset(12)
            make.height.equalTo(70)
        }
    }
    
    func configureEmailField() {
        view.addSubview(emailTextField)
        emailTextField.placeholder = "   Type email"
        emailTextField.layer.borderWidth = 1.5
        emailTextField.layer.borderColor = UIColor(hexString: "#bae4e5").withAlphaComponent(0.3).cgColor
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(50)
            make.width.equalToSuperview().offset(-25)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            
        }
    }
    
    func configurePasswordField() {
        view.addSubview(passwordTextField)
        passwordTextField.placeholder = "   Password"
        passwordTextField.layer.borderWidth = 1.5
        passwordTextField.layer.borderColor = UIColor(hexString: "#bae4e5").withAlphaComponent(0.3).cgColor
        passwordTextField.isSecureTextEntry = true
        
        passwordTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-25)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
        }
    }
    
    func configureSignInButton() {
        view.addSubview(signInButton)
        signInButton.layer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 25, height: 30)
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = UIColor(hexString: "#bae4e5")
        signInButton.layer.cornerRadius = 15
        signInButton.clipsToBounds = true
        signInButton.setTitleColor(UIColor(hexString: "#284387"), for: .normal)
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.width.equalToSuperview().offset(-25)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    func configureSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.layer.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.gray, for: .normal)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(30)
        }
    }
    
    func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(button)
        self.present(alert, animated: true)
        
    }
}
