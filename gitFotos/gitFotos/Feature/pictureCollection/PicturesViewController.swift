//
//  PicturesViewController.swift
//  gitFotos
//
//  Created by erick silva teran on 26/10/2020.
//

import Foundation
import UIKit

class PictureViewController: UIViewController  {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
}
extension PictureViewController: UICollectionViewDataSource {
    
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
}
    
