//
//  loginViewController.swift
//  Affix
//
//  Created by Fujia Ren on 6/15/19.
//  Copyright © 2019 Fujia Ren. All rights reserved.
//

import Foundation
import UIKit

class loginViewController: UIViewController{
    
    var loginTitle: UILabel!
    var username: UILabel!
    var userText: UITextField!
    var password: UILabel!
    var passText: UITextField!
    var signUp: UIButton!
    var enter: UIButton!
    
    let initWidth = UIScreen.main.bounds.width
    let initHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let background = UIImageView(frame: UIScreen.main.bounds)
        background.image = UIImage(named: "pinkBack")
        background.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(background, at: 0)
        self.navigationController?.isNavigationBarHidden = true
        
        let circ = UIView(frame: CGRect(x: 0.0, y: 0.0, width: initWidth * 0.85, height: initHeight/2))
        circ.center = self.view.center
        circ.layer.cornerRadius = 20
        circ.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.3)
        
        loginTitle = UILabel()
        loginTitle.text = "Log In:"
        loginTitle.textColor = .white
        loginTitle.translatesAutoresizingMaskIntoConstraints = false
        loginTitle.font = UIFont(name: "Avenir-Light", size: 65)
        
        username = UILabel()
        username.text = "Name:"
        username.textColor = .white
        username.translatesAutoresizingMaskIntoConstraints = false
        username.font = UIFont(name: "Avenir-Light", size: 45)
        
        userText = UITextField()
        userText.textColor = .black
        userText.font = UIFont(name: "Avenir-Light", size: 28)
        userText.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.3)
        userText.returnKeyType = .done
        userText.placeholder = " Enter name...       "
        userText.textAlignment = NSTextAlignment.center
        userText.translatesAutoresizingMaskIntoConstraints = false
        
        password = UILabel()
        password.text = "Email:"
        password.textColor = .white
        password.translatesAutoresizingMaskIntoConstraints = false
        password.font = UIFont(name: "Avenir-Light", size: 45)
        
        passText = UITextField()
        passText.textColor = .black
        passText.font = UIFont(name: "Avenir-Light", size: 28)
        passText.returnKeyType = .done
        passText.textAlignment = NSTextAlignment.center
        passText.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.3)
        passText.placeholder = " Enter your email... "
        passText.translatesAutoresizingMaskIntoConstraints = false
        
        enter = UIButton()
        enter.setTitle("      Enter      ", for: .normal)
        enter.translatesAutoresizingMaskIntoConstraints = false
        enter.setTitleColor(.white, for: .normal)
        enter.reversesTitleShadowWhenHighlighted = true
        enter.titleLabel?.font = UIFont(name: "Avenir-Light", size: 37)
        enter.layer.cornerRadius = 30
        enter.layer.borderColor = UIColor.white.cgColor
        enter.layer.borderWidth = 1
        enter.backgroundColor = UIColor.clear
        enter.addTarget(self, action: #selector(self.enterPressed), for: .touchUpInside)
        
        signUp = UIButton()
        signUp.setTitle(" Click Here to Sign Up!", for: .normal)
        signUp.translatesAutoresizingMaskIntoConstraints = false
        signUp.setTitleColor(.white, for: .normal)
        signUp.reversesTitleShadowWhenHighlighted = true
        signUp.addTarget(self, action: #selector(self.signUpPressed), for: .touchUpInside)
        signUp.titleLabel?.font = UIFont(name: "Avenir-Light", size: 22)
        
        view.addSubview(circ)
        view.addSubview(loginTitle)
        view.addSubview(username)
        view.addSubview(userText)
        view.addSubview(password)
        view.addSubview(passText)
        view.addSubview(enter)
        view.addSubview(signUp)
        
        setupConstraints()
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: initHeight/8),
            loginTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: initHeight/20),
            username.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        
        NSLayoutConstraint.activate([
            userText.topAnchor.constraint(equalTo: username.bottomAnchor, constant: initHeight/32),
            userText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        
        NSLayoutConstraint.activate([
            password.topAnchor.constraint(equalTo: userText.bottomAnchor, constant: initHeight/30),
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        
        NSLayoutConstraint.activate([
            passText.topAnchor.constraint(equalTo: password.bottomAnchor, constant: initHeight/32),
            passText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        
        NSLayoutConstraint.activate([
            enter.topAnchor.constraint(equalTo: passText.bottomAnchor, constant: initHeight/27),
            enter.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            signUp.topAnchor.constraint(equalTo: passText.bottomAnchor, constant: initHeight/6),
            signUp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        
    }
    @objc func enterPressed(sender: UIButton) {
        let newVC = ViewController()
        self.present(newVC, animated: true)
    }
    @objc func signUpPressed(sender: UIButton) {
        let newVC = signUpViewController()
        self.present(newVC, animated: true)
    }
}
