//
//  ViewController.swift
//  Affix
//
//  Created by Fujia Ren on 6/15/19.
//  Copyright © 2019 Fujia Ren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var name: UILabel!
    var id: UILabel!
    var rank: UILabel!
    
    var percent: UILabel!
    var date: UILabel!
    var level: UILabel!
    
    var start: UIButton!
    var secondColor: UIButton!
    var thirdColor: UIButton!
    var biometrics: UIButton!
    
    var firstLayer: CAGradientLayer!
    var afternoonLayer: CAGradientLayer!
    var torusGradient: CAGradientLayer!
    
    var torus: CAShapeLayer!
    
    var expRatio = 0.0
    var userLevel = 1
    var userName = "dummy Name"
    
    let morningC1 = UIColor(red: 0.4, green: 0.2, blue: 0.6, alpha:1.0)
    let morningC2 = UIColor(red: 0.96, green: 0.28, blue: 0.28, alpha:1.0)
    let morningC3 = UIColor(red: 0.97, green: 0.58, blue: 0.02, alpha:1.0)
    
    let afternoonC1 = UIColor(red: 0.77, green: 0.94, blue: 0.97, alpha:1.0)
    let afternoonC2 = UIColor(red: 0.99, green: 0.89, blue: 0.65, alpha:1.0)
    let afternoonC3 = UIColor(red: 0.94, green: 0.91, blue: 0.99, alpha:1.0)
    let afternoonC4 = UIColor(red: 0.83, green: 0.72, blue: 1.0, alpha:1.0)
    
    let initWidth = UIScreen.main.bounds.width
    let initHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        initLayer()
        
        expRatio = 0.75
        userLevel = 2

        name = UILabel()
        name.text = userName
        print(userName)
        name.textColor = .white
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name: "Avenir-Light", size:42)
        
        id = UILabel()
        id.text = "dummy id"
        id.textColor = .white
        id.translatesAutoresizingMaskIntoConstraints = false
        id.font = UIFont(name: "Avenir-Light", size: 22)
        
        rank = UILabel()
        rank.text = "dummy rank"
        rank.textColor = .white
        rank.translatesAutoresizingMaskIntoConstraints = false
        rank.font = UIFont(name: "Avenir-Light", size: 22)
        
        percent = UILabel()
        percent.text = " " + String(Int(expRatio * 100)) + "%"
        percent.textColor = .white
        percent.translatesAutoresizingMaskIntoConstraints = false
        percent.font = UIFont(name: "Avenir-Light", size: 62)
        
        date = UILabel()
        date.text = "put your date here"
        date.textColor = .white
        date.translatesAutoresizingMaskIntoConstraints = false
        date.font = UIFont(name: "Avenir-Light", size: 22)
        
        level = UILabel()
        level.text = "Level " + String(userLevel)
        level.textColor = .white
        level.translatesAutoresizingMaskIntoConstraints = false
        level.font = UIFont(name: "Avenir-Light", size: 22)
        
        start = UIButton()
        start.setTitle("       Next       ", for: .normal)
        start.translatesAutoresizingMaskIntoConstraints = false
        start.setTitleColor(.white, for: .normal)
        start.reversesTitleShadowWhenHighlighted = true
        start.titleLabel?.font = UIFont(name: "Avenir-Light", size: 37)
        start.layer.cornerRadius = 30
        start.layer.borderColor = UIColor.white.cgColor
        start.layer.borderWidth = 1
        start.backgroundColor = UIColor.clear
        
        torus = CAShapeLayer()
        
        expGradient(ratio: 0.75)
        
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: initHeight, height: initHeight))
        path.append(UIBezierPath(ovalIn: CGRect(x: initWidth*0.15, y: initWidth*0.15, width: initWidth*0.55, height: initWidth*0.55)).reversing())
        
        torus.path = path.cgPath
        torus.fillColor = UIColor.blue.cgColor
        torus.frame = self.view.bounds
        
        torusGradient.mask = torus
        
        view.addSubview(name)
        view.addSubview(id)
        view.addSubview(rank)
        view.addSubview(percent)
        view.addSubview(level)
        view.addSubview(start)
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.topAnchor, constant: initHeight/8),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            id.topAnchor.constraint(equalTo: name.bottomAnchor, constant: initHeight/64),
            id.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        NSLayoutConstraint.activate([
            rank.topAnchor.constraint(equalTo: id.bottomAnchor, constant: initHeight/64),
            rank.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        NSLayoutConstraint.activate([
            percent.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -initHeight/16),
            percent.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        NSLayoutConstraint.activate([
            level.topAnchor.constraint(equalTo: percent.bottomAnchor, constant: initHeight/64),
            level.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        NSLayoutConstraint.activate([
            start.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -initHeight/4.5),
            start.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
    }
    
    func initLayer(){
        firstLayer = CAGradientLayer()
        firstLayer.frame = self.view.bounds
        firstLayer.colors = [morningC1.cgColor, morningC2.cgColor, morningC3.cgColor]
        self.view.layer.insertSublayer(firstLayer, at: 0)
    }
    
    func secondLayer(){
        afternoonLayer = CAGradientLayer()
        afternoonLayer.frame = self.view.bounds
        afternoonLayer.colors = [afternoonC1.cgColor, afternoonC2.cgColor, afternoonC3.cgColor, afternoonC4.cgColor]
        self.view.layer.insertSublayer(afternoonLayer, at: 0)
    }
    
    func expGradient(ratio: Float) -> (){
        torusGradient = CAGradientLayer()
        torusGradient.frame = CGRect(x: initWidth*0.15, y: initHeight*1/3, width: initWidth * 0.85, height: initWidth * 0.85)
        let lightWisteria = UIColor(red: 241/255, green: 169/255, blue: 160/255, alpha: 0.7)
        torusGradient.colors = [UIColor.clear.cgColor, lightWisteria.cgColor]
        torusGradient.position = CGPoint(x: initWidth/2, y: initHeight/2)
        torusGradient.cornerRadius = (initWidth * 0.85)/2
        torusGradient.locations = [0.0, ratio] as [NSNumber]
        self.view.layer.insertSublayer(torusGradient, at: 1)
    }


}

