//
//  ViewController.swift
//  cryptoCurrency
//
//  Created by Baudunov Rapkat on 4/21/20.
//  Copyright © 2020 Baudunov Rapkat. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {
    
    @IBOutlet var tableViewReload: UITableView!
    
    var welcome:Welcome?
    var cryptoNames : [Datum] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNames()
    }
    
    func updateNames(){
        Servers.shared.updateCryptoCurrencyInfo(completion: updateCryptoNames)
    }
    
    func updateCryptoNames(info:Welcome){
        for i in (info.Data!){
            cryptoNames.append(i)
            tableViewReload.reloadData()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CryptoTableViewCell
        
        if cryptoNames.isEmpty {
            return cell
        }
        
        cell.cryptoNameView.text = cryptoNames[indexPath.row].CoinInfo!.FullName!.description
        
        cell.cryptoPriceView.text = cryptoNames[indexPath.row].DISPLAY!.USD!.PRICE!.description
        
        if (cryptoNames[indexPath.row].RAW?.USD?.CHANGE24HOUR)! <= 0.0 {
            cell.cryptoPriceView.textColor = .red
        }else{
            cell.cryptoPriceView.textColor = .green
        }
        
        cell.currentImageView.image = UIImage(named: cryptoNames[indexPath.row].CoinInfo!.Name!.description)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = cryptoNames[indexPath.row]
        performSegue(withIdentifier: "MasterToDetail", sender: data)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MasterToDetail"{
            let destVC = segue.destination as! SecondViewController
            destVC.data = (sender as! Datum)
        }
    }
    
    
    
}

