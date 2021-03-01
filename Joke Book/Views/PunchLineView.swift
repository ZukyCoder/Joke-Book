//
//  PunchLineView.swift
//  Joke Book
//
//  Created by Developer on 01/03/2021.
//

import UIKit

class PunchLineView: UIViewController {
    
    var punchLabelString:String?
    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var popView: UIView!
    @IBOutlet weak var punchLable: UILabel!
    @IBOutlet weak var back: UIButton!
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        popView.layer.cornerRadius = 15
        gradient ()
        popView.bringSubviewToFront(punchLable)
        popView.bringSubviewToFront(back)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        punchLable.text = punchLabelString
        // Do any additional setup after loading the view.
    }
    
    func gradient () {
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.popView.bounds
        
        gradientLayer.cornerRadius = 15
        gradientLayer.colors = [UIColor.systemYellow.cgColor, UIColor.red.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        self.popView.layer.addSublayer(gradientLayer)
        
    }

    

}
