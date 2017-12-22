//
//  PaisesTV.swift
//  BanderasProyecto4
//
//  Created by user130165 on 10/28/17.
//  Copyright © 2017 KevinGonzalez. All rights reserved.
//

import UIKit

let AllContinentes = ["Africa", "Asia", "Europe", "North_America", "Oceania", "South_America"]
var EnabledContinentes = ["Africa":false, "Asia":false, "Europe":false, "North_America":false, "Oceania":false, "South_America":true]
var selectedPais = ""
var selectedBandera : UIImage? = nil

class PaisesTV: UITableViewController {

    var allPaises = [Array<String>]()
    var ListaPaisesAfr : [String] = []
    var ListaPaisesAsi : [String] = []
    var ListaPaisesEur : [String] = []
    var ListaPaisesNA : [String] = []
    var ListaPaisesOce : [String] = []
    var ListaPaisesSA : [String] = []
    var ListaAllPaises : [Array<String>] = [[]]
    var listaContinente : [String] = []
    var ListaAllImg : [Array<String>] = []
    
    var ListaImagenesAfr : [String] = []
    var ListaImagenesAsi : [String] = []
    var ListaImagenesEur : [String] = []
    var ListaImagenesNA : [String] = []
    var ListaImagenesOce : [String] = []
    var ListaImagenesSA : [String] = []
    var primeraVez = true
    
    func obtenerNombres (inputString : String) -> Array<String>
    {
        let paths = Bundle.main.paths(forResourcesOfType: "png", inDirectory: inputString) as [NSString]
        var myArray : Array<String> = []
        var contador = 0
        for path in paths
        {
            myArray.append((path.lastPathComponent as NSString) as String)
            myArray[contador] = myArray[contador].replacingOccurrences(of: inputString, with: "")
            myArray[contador] = myArray[contador].replacingOccurrences(of: ".png", with: "")
            myArray[contador] = myArray[contador].replacingOccurrences(of: "-", with: "")
            myArray[contador] = myArray[contador].replacingOccurrences(of: "_", with: " ")
            contador = contador + 1
        }
        
        return myArray
    }
    
    func obtenerImagenes (inputString : String) -> Array<String>
    {
        let paths = Bundle.main.paths(forResourcesOfType: "png", inDirectory: inputString) as [NSString]
        var myArray : Array<String> = []
        for path in paths
        {
            myArray.append((path.lastPathComponent as NSString) as String)
        }
        return myArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(primeraVez)
        {
            ListaPaisesAfr = obtenerNombres(inputString: "Africa")
            ListaImagenesAfr = obtenerImagenes(inputString: "Africa")
            ListaPaisesAsi = obtenerNombres(inputString: "Asia")
            ListaImagenesAsi = obtenerImagenes(inputString: "Asia")
            ListaPaisesEur = obtenerNombres(inputString: "Europe")
            ListaImagenesEur = obtenerImagenes(inputString: "Europe")
            ListaPaisesNA = obtenerNombres(inputString: "North_America")
            ListaImagenesNA = obtenerImagenes(inputString: "North_America")
            ListaPaisesOce = obtenerNombres(inputString: "Oceania")
            ListaImagenesOce = obtenerImagenes(inputString: "Oceania")
            ListaPaisesSA = obtenerNombres(inputString: "South_America")
            ListaImagenesSA = obtenerImagenes(inputString: "South_America")
            primeraVez = false
        }
        //se arma el arreglo de arreglos
        ListaAllPaises.removeAll()
        ListaAllImg.removeAll()
        listaContinente.removeAll()
        for Nombre in AllContinentes
        {
            let valor = EnabledContinentes[Nombre]!
            if (valor)
            {
                listaContinente.append(Nombre)
                switch Nombre {
                case "Africa":
                    ListaAllImg.append(ListaImagenesAfr)
                    ListaAllPaises.append(ListaPaisesAfr)
                case "Asia":
                    ListaAllImg.append(ListaImagenesAsi)
                    ListaAllPaises.append(ListaPaisesAsi)
                case "Europe":
                    ListaAllImg.append(ListaImagenesEur)
                    ListaAllPaises.append(ListaPaisesEur)
                case "North_America":
                    ListaAllImg.append(ListaImagenesNA)
                    ListaAllPaises.append(ListaPaisesNA)
                case "Oceania":
                    ListaAllImg.append(ListaImagenesOce)
                    ListaAllPaises.append(ListaPaisesOce)
                case "South_America":
                    ListaAllImg.append(ListaImagenesSA)
                    ListaAllPaises.append(ListaPaisesSA)
                default:
                    print("Error continente no encontrado")
                }
            }
        }
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //se arma el arreglo de arreglos
        ListaAllPaises.removeAll()
        ListaAllImg.removeAll()
        listaContinente.removeAll()
        for Nombre in AllContinentes
        {
            let valor = EnabledContinentes[Nombre]!
            
            if (valor)
            {
                listaContinente.append(Nombre)
                switch Nombre {
                case "Africa":
                    ListaAllImg.append(ListaImagenesAfr)
                    ListaAllPaises.append(ListaPaisesAfr)
                case "Asia":
                    ListaAllImg.append(ListaImagenesAsi)
                    ListaAllPaises.append(ListaPaisesAsi)
                case "Europe":
                    ListaAllImg.append(ListaImagenesEur)
                    ListaAllPaises.append(ListaPaisesEur)
                case "North_America":
                    ListaAllImg.append(ListaImagenesNA)
                    ListaAllPaises.append(ListaPaisesNA)
                case "Oceania":
                    ListaAllImg.append(ListaImagenesOce)
                    ListaAllPaises.append(ListaPaisesOce)
                case "South_America":
                    ListaAllImg.append(ListaImagenesSA)
                    ListaAllPaises.append(ListaPaisesSA)
                default:
                    print("Error continente no encontrado")
                }
            }
        }
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return ListaAllPaises.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListaAllPaises[section].count
    }
    
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listPaises", for: indexPath)
        
        
        if let paisCell = cell as? PaisTVCell
        {
            var nombreArchivo = ListaAllImg[indexPath.section][indexPath.row]
            nombreArchivo = nombreArchivo.replacingOccurrences(of: ".png", with: "")
            paisCell.bandera = UIImage(named: nombreArchivo)
            //print(ListaAllImg[indexPath.section][indexPath.row])
            var nombrePais = ListaAllImg[indexPath.section][indexPath.row]
            nombrePais = nombrePais.replacingOccurrences(of: ".png", with: "")
            nombrePais = nombrePais.replacingOccurrences(of: "_", with: " ")
            paisCell.pais = nombrePais
        
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listaContinente[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //genero string del pais seleccionadao
        var myPais = ListaAllImg[indexPath.section][indexPath.row]
        myPais = myPais.replacingOccurrences(of: ".png", with: "")
        myPais = myPais.replacingOccurrences(of: "_", with: " ")
        selectedPais = myPais
        //genero imagen de la bandera
        var nombreArchivo = ListaAllImg[indexPath.section][indexPath.row]
        nombreArchivo = nombreArchivo.replacingOccurrences(of: ".png", with: "")
        selectedBandera = UIImage(named: nombreArchivo)
        
        performSegue(withIdentifier: "showBigFlag", sender: self)
    }

  
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        segue.destination.navigationItem.title = selectedPais
    }

}
