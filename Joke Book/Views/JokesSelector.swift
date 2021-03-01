//
//  JokesSelector.swift
//  Joke Book
//
//  Created by Developer on 25/02/2021.
//

import UIKit

class JokesSelector: UIViewController {
    
    var selection: String?
    var jokesList: [jokesModel]?
    var punchLine:String?
    var gradientLayer: CAGradientLayer!
    
    var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.alpha = 0.5
        
        blurEffectView.autoresizingMask = [
            .flexibleWidth, .flexibleHeight
        ]
        
        return blurEffectView
    }()
    @IBOutlet weak var titleView: UIView!
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Mycell")
         
        
        loadingView()
        titulo.text = selection?.uppercased()
        callEndPoint(selected: selection ?? "" ) { (reponse) in
            switch reponse {
              case.success(let jokes):
                self.jokesList = jokes
        
                DispatchQueue.main.async {
                     self.loadingIndicator.stopAnimating()
                     self.loadingIndicator.isHidden = true
                     self.tableView.reloadData()
                }
                
            case .failure(let err):
                print("Fail to fetch with error:", err)
                self.loadingIndicator.removeFromSuperview()
            }
        }
    }
    
    fileprivate func callEndPoint(selected: String, completion: @escaping (Result<[jokesModel], Error>) -> ()) {
       
        let urlString = "https://official-joke-api.appspot.com/jokes/\(selected)/ten"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            //fail
            if let err = err {
                print("FAIL")
                completion(.failure(err))
            }
            //success
            do{
                print("SUCCESS")
                let jokes = try JSONDecoder().decode([jokesModel].self, from: data!)
                completion(.success(jokes))
            } catch let jsonErr {
                completion(.failure(jsonErr))
            }
            
        }.resume()
    }
    
    
    func loadingView () {
        
        loadingIndicator.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        loadingIndicator.startAnimating()
        
        blurEffectView.frame = self.loadingIndicator.bounds
        loadingIndicator.insertSubview(blurEffectView, at: 0)
        
        loadingIndicator.isHidden = false
        
    }
    
    func gradient () {
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        let color1 = UIColor(displayP3Red: 0/255, green: 144/255, blue: 81/255, alpha: 0.5)
        let color2 = UIColor(displayP3Red:115/255, green: 252/255, blue: 214/255, alpha: 0.5)
        
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        self.view.layer.addSublayer(gradientLayer)
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PunchLineView
        vc.punchLabelString = punchLine
        
        
    }
    

}

extension JokesSelector:  UITableViewDelegate, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return 40
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return jokesList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AutoSizeCellTableViewCell
        cell.resizingLabel.text = jokesList?[indexPath.row].setup
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        punchLine = jokesList?[indexPath.row].punchline
        
        performSegue(withIdentifier: "toPunch", sender: nil)
    }
    
}
