//
//  PaisTVCell.swift
//  BanderasProyecto4
//
//  Created by user130165 on 10/28/17.
//  Copyright © 2017 KevinGonzalez. All rights reserved.
//

import UIKit

class PaisTVCell: UITableViewCell {

    @IBOutlet weak var BanderaImg: UIImageView!
    @IBOutlet weak var BanderaStr: UILabel!
    
    var pais:String?
    {didSet{updateUI()}}
    var bandera:UIImage? {didSet{updateUI()}}
    
    private func updateUI()
    {
        BanderaStr.text = pais
        BanderaImg.image = bandera
    }
    
    
    
}
