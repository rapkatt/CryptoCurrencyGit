//
//  CryptoTableViewCell.swift
//  cryptoCurrency
//
//  Created by Baudunov Rapkat on 4/21/20.
//  Copyright © 2020 Baudunov Rapkat. All rights reserved.
//

import UIKit

class CryptoTableViewCell: UITableViewCell{
    
    static let shared2 = CryptoTableViewCell()
    
    @IBOutlet weak var currentImageView: UIImageView!
    @IBOutlet weak var cryptoNameView: UILabel!
    @IBOutlet weak var cryptoPriceView: UILabel!
}
