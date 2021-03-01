//
//  ViewController.swift
//  Joke Book
//
//  Created by Developer on 22/02/2021.
//

import UIKit

class ViewController: UIViewController {

    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var backGround: UIView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        viewSetup()
        nextButton.layer.cornerRadius = 15
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func viewSetup(){
        gradient ()
    }
    
    
    @IBAction func toNextView(_ sender: Any) {
        
    }
    
    
    func gradient () {
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.backGround.bounds
        
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        self.backGround.layer.addSublayer(gradientLayer)
    }
    

}

