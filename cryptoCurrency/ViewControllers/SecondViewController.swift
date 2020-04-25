//
//  SecondViewController.swift
//  cryptoCurrency
//
//  Created by Baudunov Rapkat on 4/21/20.
//  Copyright © 2020 Baudunov Rapkat. All rights reserved.
//

import UIKit
import Charts
import TinyConstraints

class SecondViewController: UIViewController,ChartViewDelegate{
    
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var marketcapView: UILabel!
    @IBOutlet weak var priceVolumeView: UILabel!
    @IBOutlet weak var changeView: UILabel!
    
    var data: Datum?
    var entries:[ChartDataEntry] = []
    
    lazy var lineChartView:LineChartView = { designForLineChart()}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        updateNameOfCrypto()
        
        view.addSubview(lineChartView)
        lineChartView.bottom(to: view)
        lineChartView.width(to:view)
        lineChartView.heightToWidth(of: view)
        
    }
    
    
    func updateNameOfCrypto(){
        Servers.shared.name = data?.CoinInfo?.Name?.description
        Servers.shared.createChart(completion: addPricesToArray)
    }
    
    func addPricesToArray(info:Chart){
        for i in (info.Data!.Data!){
            let pricey = i.close
            let pricex = i.open
            let valuey = ChartDataEntry(x: pricex!, y: pricey!)
            entries.append(valuey)
        }
        
        entries.sort(by: { $0.x < $1.x })
        setData()
    }
    
}


