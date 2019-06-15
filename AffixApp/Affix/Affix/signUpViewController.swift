//
//  signUpViewController.swift
//  Affix
//
//  Created by Fujia Ren on 6/15/19.
//  Copyright © 2019 Fujia Ren. All rights reserved.
//

import Foundation
import UIKit

class signUpViewController: UIViewController{
    
    var signUpTitle: UILabel!
    var name: UILabel!
    var nameText: UITextField!
    var phoneNum: UILabel!
    var phoneNumText: UITextField!
    var email: UILabel!
    var emailText: UITextField!
    var height: UILabel!
    var heightText: UITextField!
    var weight: UILabel!
    var weightText: UITextField!
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
        
        signUpTitle = UILabel()
        signUpTitle.text = "Sign Up: "
        signUpTitle.textColor = .white
        signUpTitle.translatesAutoresizingMaskIntoConstraints = false
        signUpTitle.font = UIFont(name: "Avenir-Light", size: 65)
        
        name = UILabel()
        name.text = "Name: "
        name.textColor = .white
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name: "Avenir-Light", size: 25)
        
        nameText = UITextField()
        nameText.textColor = .black
        nameText.font = UIFont(name: "Avenir-Light", size: 25)
        nameText.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.3)
        nameText.returnKeyType = .done
        nameText.placeholder = " Enter name...     "
        nameText.textAlignment = NSTextAlignment.center
        nameText.translatesAutoresizingMaskIntoConstraints = false
        
        phoneNum = UILabel()
        phoneNum.text = "Cell Number: "
        phoneNum.textColor = .white
        phoneNum.translatesAutoresizingMaskIntoConstraints = false
        phoneNum.font = UIFont(name: "Avenir-Light", size: 25)
        
        phoneNumText = UITextField()
        phoneNumText.textColor = .black
        phoneNumText.font = UIFont(name: "Avenir-Light", size: 25)
        phoneNumText.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.3)
        phoneNumText.returnKeyType = .done
        phoneNumText.placeholder = " Enter #...       "
        phoneNumText.textAlignment = NSTextAlignment.center
        phoneNumText.translatesAutoresizingMaskIntoConstraints = false
        
        email = UILabel()
        email.text = "Email: "
        email.textColor = .white
        email.translatesAutoresizingMaskIntoConstraints = false
        email.font = UIFont(name: "Avenir-Light", size: 25)
        
        emailText = UITextField()
        emailText.textColor = .black
        emailText.font = UIFont(name: "Avenir-Light", size: 25)
        emailText.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.3)
        emailText.returnKeyType = .done
        emailText.placeholder = " Enter email...       "
        emailText.textAlignment = NSTextAlignment.center
        emailText.translatesAutoresizingMaskIntoConstraints = false
        
        height = UILabel()
        height.text = "height (in): "
        height.textColor = .white
        height.translatesAutoresizingMaskIntoConstraints = false
        height.font = UIFont(name: "Avenir-Light", size: 25)
        
        heightText = UITextField()
        heightText.textColor = .black
        heightText.font = UIFont(name: "Avenir-Light", size: 25)
        heightText.returnKeyType = .done
        heightText.textAlignment = NSTextAlignment.center
        heightText.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.3)
        heightText.placeholder = " Enter height.. "
        heightText.translatesAutoresizingMaskIntoConstraints = false
        
        weight = UILabel()
        weight.text = "weight (lb): "
        weight.textColor = .white
        weight.translatesAutoresizingMaskIntoConstraints = false
        weight.font = UIFont(name: "Avenir-Light", size: 25)
        
        weightText = UITextField()
        weightText.textColor = .black
        weightText.font = UIFont(name: "Avenir-Light", size: 25)
        weightText.returnKeyType = .done
        weightText.textAlignment = NSTextAlignment.center
        weightText.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.3)
        weightText.placeholder = " Enter weight... "
        weightText.translatesAutoresizingMaskIntoConstraints = false
        
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

        view.addSubview(circ)
        view.addSubview(signUpTitle)
        view.addSubview(name)
        view.addSubview(nameText)
        view.addSubview(phoneNum)
        view.addSubview(phoneNumText)
        view.addSubview(email)
        view.addSubview(emailText)
        view.addSubview(height)
        view.addSubview(heightText)
        view.addSubview(weight)
        view.addSubview(weightText)
        view.addSubview(enter)
        
        setupConstraints()
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            signUpTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: initHeight/8),
            signUpTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: signUpTitle.bottomAnchor, constant: initHeight/25),
            name.leftAnchor.constraint(equalTo: view.leftAnchor, constant: initWidth/10),
            ])
        
        NSLayoutConstraint.activate([
            nameText.topAnchor.constraint(equalTo: signUpTitle.bottomAnchor, constant: initHeight/25),
            nameText.leftAnchor.constraint(equalTo: name.rightAnchor, constant: initWidth/27),
            ])
        
        NSLayoutConstraint.activate([
            phoneNum.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: initHeight/37),
            phoneNum.leftAnchor.constraint(equalTo: view.leftAnchor, constant: initWidth/10),
            ])
        
        NSLayoutConstraint.activate([
            phoneNumText.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: initHeight/37),
            phoneNumText.leftAnchor.constraint(equalTo: phoneNum.rightAnchor, constant: initWidth/27),
            ])
        
        NSLayoutConstraint.activate([
            email.topAnchor.constraint(equalTo: phoneNumText.bottomAnchor, constant: initHeight/37),
            email.leftAnchor.constraint(equalTo: view.leftAnchor, constant: initWidth/10),
            ])
        
        NSLayoutConstraint.activate([
            emailText.topAnchor.constraint(equalTo: phoneNumText.bottomAnchor, constant: initHeight/37),
            emailText.leftAnchor.constraint(equalTo: email.rightAnchor, constant: initWidth/27),
            ])
        NSLayoutConstraint.activate([
            height.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: initHeight/37),
            height.leftAnchor.constraint(equalTo: view.leftAnchor, constant: initWidth/10),
            ])
        
        NSLayoutConstraint.activate([
            heightText.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: initHeight/37),
            heightText.leftAnchor.constraint(equalTo: height.rightAnchor, constant: initWidth/27),
            ])
        
        NSLayoutConstraint.activate([
            weight.topAnchor.constraint(equalTo: heightText.bottomAnchor, constant: initHeight/37),
            weight.leftAnchor.constraint(equalTo: view.leftAnchor, constant: initWidth/10),
            ])
        
        NSLayoutConstraint.activate([
            weightText.topAnchor.constraint(equalTo: heightText.bottomAnchor, constant: initHeight/37),
            weightText.leftAnchor.constraint(equalTo: weight.rightAnchor, constant: initWidth/27),
            ])
        
        NSLayoutConstraint.activate([
            enter.topAnchor.constraint(equalTo: weightText.bottomAnchor, constant: initHeight/27),
            enter.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
    }
    @objc func enterPressed(sender: UIButton) {
        let newVC = ViewController()
        self.present(newVC, animated: true)
    }
}

