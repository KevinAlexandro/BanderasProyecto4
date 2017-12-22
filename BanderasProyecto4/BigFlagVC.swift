//
//  BigFlagVC.swift
//  BanderasProyecto4
//
//  Created by user130165 on 10/29/17.
//  Copyright © 2017 KevinGonzalez. All rights reserved.
//

import UIKit

class BigFlagVC: UIViewController {

    @IBOutlet weak var BanderaIV: UIImageView!
    @IBOutlet weak var banderaLbl: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        BanderaIV.image = selectedBandera!
        banderaLbl.text = selectedPais
    }
}
