//
//  SecondViewController.swift
//  cryptoCurrency
//
//  Created by Baudunov Rapkat on 4/21/20.
//  Copyright © 2020 Baudunov Rapkat. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var marketcapView: UILabel!
    @IBOutlet weak var priceVolumeView: UILabel!
    @IBOutlet weak var changeView: UILabel!
   
    var data: Datum?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setUI()
    }
    
    func setUI(){
        cryptoName.text = data?.CoinInfo?.FullName?.description
        marketcapView.text = data?.DISPLAY?.USD?.PRICE?.description
        priceVolumeView.text = data?.DISPLAY?.USD?.VOLUME24HOUR?.description
        changeView.text = data?.DISPLAY?.USD?.CHANGE24HOUR?.description

    }

}
