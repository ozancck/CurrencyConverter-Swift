//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ozan Çiçek on 29.10.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        }
    
    @IBAction func getRatesClicked(_ sender: Any) {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
               
               let session = URLSession.shared
               
               //Closure
               
               let task = session.dataTask(with: url!) { (data, response, error) in
                   if error != nil {
                       let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                       let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                       alert.addAction(okButton)
                       self.present(alert, animated: true, completion: nil)
                       
                   } else {
                       // 2.
                       if data != nil {
                           do {
                           let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                               
                               DispatchQueue.main.async {
                                   print(jsonResponse)
                               }
                               
                    } catch {
                        print("error")
                    }
                }

            }

        }

        task.resume()
    }
    
    
    
}


    

