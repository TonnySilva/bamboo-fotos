//
//  PicturesViewController.swift
//  gitFotos
//
//  Created by erick silva teran on 26/10/2020.
//

import Foundation
import UIKit

class PictureViewController: UIViewController  {
  private let reuseIdentifier = String(describing: PicturesCell.self)
    
    @IBOutlet weak var collectionView: UICollectionView!
    
  override func viewDidLoad() {
    // sirve para cargar el .xib en la constante
    let nib = UINib(nibName: reuseIdentifier, bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    super.viewDidLoad()
    
  }
}
extension PictureViewController: UICollectionViewDataSource {
    
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 150
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
}
  extension PictureViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
      print(indexPath.item)
    }
extension UICollectionViewDelegateFlowLayout
      }
  

