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
    
    var dailyCheckIn: UILabel!
    var date: UILabel!
    var time: UILabel!
    
    var firstColor: UIButton!
    var secondColor: UIButton!
    var thirdColor: UIButton!
    var biometrics: UIButton!
    
    var firstLayer: CAGradientLayer!
    var afternoonLayer: CAGradientLayer!
    
    let morningC1 = UIColor(red: 0.4, green: 0.2, blue: 0.6, alpha:1.0)
    let morningC2 = UIColor(red: 0.96, green: 0.28, blue: 0.28, alpha:1.0)
    let morningC3 = UIColor(red: 0.97, green: 0.58, blue: 0.02, alpha:1.0)
    
    let afternoonC1 = UIColor(red: 0.77, green: 0.94, blue: 0.97, alpha:1.0)
    let afternoonC2 = UIColor(red: 0.99, green: 0.89, blue: 0.65, alpha:1.0)
    let afternoonC3 = UIColor(red: 0.94, green: 0.91, blue: 0.99, alpha:1.0)
    let afternoonC4 = UIColor(red: 0.83, green: 0.72, blue: 1.0, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        //initLayer()
        secondLayer()
        
        let circ = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: 450.0))
        circ.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        circ.layer.cornerRadius = 20
        //to change the transparency, increase and decrease the alpha value
        circ.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7)
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


}

