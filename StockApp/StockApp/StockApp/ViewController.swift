//
//  ViewController.swift
//  StockApp
//
//  Created by user923902 on 11/2/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {

    
    @IBOutlet weak var txtSymbol: UITextField!
     
    @IBOutlet weak var lblCEO: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

   
    @IBAction func getStockValues(_ sender: Any) {
        guard let stockName = txtSymbol.text else { return }
       
        let url = "\(apiURL)\(stockName)?apikey=\(apiKey)"
               
        SwiftSpinner.show("Getting Stock Value for \(stockName)")
        
        AF.request(url).responseJSON{ (response) in
            SwiftSpinner.hide()
            
            if response.error == nil {
                guard let jsonstring = response.data else {return}
                guard let stocks : [JSON] = JSON(jsonstring).array else {return}
                
                if stocks.count < 1 {return}
                guard let ceo = stocks[0]["ceo"].rawString() else {return}
                guard let price = stocks[0]["price"].double else {return}
                
                self.lblCEO.text = ceo
                self.lblPrice.text = "$ \(price)"
                
            }
            
            
            
        }
    }
    
    
}

