//
//  CategoryView.swift
//  Joke Book
//
//  Created by Developer on 24/02/2021.
//

import UIKit

class CategoryView: UIViewController {
    
    var userSelection = ""

    @IBOutlet weak var oGeneral: UIButton!
    
    @IBOutlet weak var oKnock: UIButton!
    
    @IBOutlet weak var oProgramming: UIButton!
    
    
    @IBAction func generalButton(_ sender: UIButton) {
        userSelection = "general"
        performSegue(withIdentifier: "toSelector", sender: nil)
    }
    
    @IBAction func knockButton(_ sender: UIButton) {
        userSelection = "knock-knock"
        performSegue(withIdentifier: "toSelector", sender: nil)
    }
    
    @IBAction func programmingButton(_ sender: UIButton) {
        userSelection = "programming"
        performSegue(withIdentifier: "toSelector", sender: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        viewSetup ()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func viewSetup () {
        oGeneral.layer.cornerRadius = 15
        oKnock.layer.cornerRadius = 15
        oProgramming.layer.cornerRadius = 15
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let uSelection = userSelection
        
        let vc = segue.destination as! JokesSelector
        vc.selection = uSelection
    }
    

}
