//
//  SettingsVC.swift
//  BanderasProyecto4
//
//  Created by user130165 on 10/28/17.
//  Copyright © 2017 KevinGonzalez. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var AfricaSw: UISwitch!
    @IBOutlet weak var AsiaSw: UISwitch!
    @IBOutlet weak var EuropeSw: UISwitch!
    @IBOutlet weak var NASW: UISwitch!
    @IBOutlet weak var OceSw: UISwitch!
    @IBOutlet weak var SASW: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (nombre, valor) in EnabledContinentes
        {
            if (!valor)
            {
                switch nombre
                {
                    case "Africa":
                        AfricaSw.setOn(false, animated: false)
                    case "Asia":
                        AsiaSw.setOn(false, animated: false)
                    case "Europe":
                        EuropeSw.setOn(false, animated: false)
                    case "North_America":
                        NASW.setOn(false, animated: false)
                    case "Oceania":
                        OceSw.setOn(false, animated: false)
                    case "South_America":
                        SASW.setOn(false, animated: false)
                    default:
                        print("Continente no encontrado en Switch")
                }
            }
        }
        
    }


    @IBAction func AfrSwitch(_ sender: UISwitch) {
        if EnabledContinentes ["Africa"]!
        {
            EnabledContinentes["Africa"] = false
        }
        else
        {
            EnabledContinentes["Africa"] = true
        }
    }

    @IBAction func AsiSwitch(_ sender: UISwitch) {
        if EnabledContinentes ["Asia"]!
        {
            EnabledContinentes["Asia"] = false
        }
        else
        {
            EnabledContinentes["Asia"] = true
        }
    }
    
    @IBAction func EurSwitch(_ sender: UISwitch) {
        if EnabledContinentes ["Europe"]!
        {
            EnabledContinentes["Europe"] = false
        }
        else
        {
            EnabledContinentes["Europe"] = true
        }
    }
    
    @IBAction func NASwitch(_ sender: UISwitch) {
        if EnabledContinentes ["North_America"]!
        {
            EnabledContinentes["North_America"] = false
        }
        else
        {
            EnabledContinentes["North_America"] = true
        }
    }
    
    @IBAction func OceSwitch(_ sender: UISwitch) {
        if EnabledContinentes ["Oceania"]!
        {
            EnabledContinentes["Oceania"] = false
        }
        else
        {
            EnabledContinentes["Oceania"] = true
        }
    }
    
    
    @IBAction func SASwitch(_ sender: UISwitch) {
        if EnabledContinentes ["South_America"]!
        {
            EnabledContinentes["South_America"] = false
        }
        else
        {
            EnabledContinentes["South_America"] = true
        }
    }
}
