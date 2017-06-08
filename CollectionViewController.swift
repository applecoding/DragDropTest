//
//  CollectionViewController.swift
//  DragDropTest
//
//  Created by Julio César Fernández Muñoz on 07/06/2017.
//  Copyright © 2017 Gabhel Studios. All rights reserved.
//

import UIKit
import MobileCoreServices

class CollectionViewController: UICollectionViewController {
    
    var datos:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        if let plistFile = Bundle.main.path(forResource: "poke-info", ofType: "plist"), let data = FileManager.default.contents(atPath: plistFile) {
            do {
                if let plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String:AnyObject] {
                    datos = plist["pokemons"] as! [String]
                }
            } catch {
                print("Error de lectura")
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! CollectionViewCell
        cell.imagen.image = UIImage(named: datos[indexPath.row])
        cell.texto.text = datos[indexPath.row]
        return cell
    }
}
