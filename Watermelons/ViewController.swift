//
//  ViewController.swift
//  Watermelons
//
//  Created by Iggy Mwangi on 3/2/17.
//  Copyright © 2017 Iggy Mwangi. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    let identifier = "CellIdentifier"
    var watermelonImages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("watermelon") {
                // this is a picture to load!
                watermelonImages.append(item)
            }
        }
        
        //print(watermelonImages)
        
    }
    
    
    //Datasource 
    //@available(iOS 6.0, *)
    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return watermelonImages.count
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    //@available(iOS 6.0, *)
    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = UIColor.yellow
        // Configure the cell
        
        let image = UIImage(named: watermelonImages[indexPath.row])
        cell.imageView.image = image
        
        return cell
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

