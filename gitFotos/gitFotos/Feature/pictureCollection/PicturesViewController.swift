//
//  PicturesViewController.swift
//  gitFotos
//
//  Created by erick silva teran on 26/10/2020.
//

import Foundation
import UIKit

class PictureViewController: UIViewController  {
  let maxHorizontalCells: CGFloat = 0
  let marginBetweenCells: CGFloat = 0
  
  private let reuseIdentifier = String(describing: PicturesCell.self) //pictures cell
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    // sirve para cargar el .xib en la constante
    let nib = UINib(nibName: reuseIdentifier, bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    super.viewDidLoad()
    
  }
}
extension PictureViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    if let pictureCell = (cell as? PicturesCell) {
      //      asignar un numero a cada celda
      pictureCell.titleLabel.text = "\(indexPath.row)"
      //      poner 2imagen marron - segunda opcion de poner imagen la k esta en //2
      pictureCell.previewImage.image = UIImage (named: "pic2")
      //      2 pictureCell.previewImage.image = #imageLiteral(resourceName: "pic2")
      
      //      imagen verde e imagen marron alternadas
      //      indexpathrow par o impar
      //      2solucion alternativas
      //     solucion 1
      //      pictureCell.previewImage.image = indexPath.row % 2 == 0 ? UIImage(named: "pic1") : UIImage(named: "pic2")
      //      solucion 2
      if indexPath.row % 2 == 0 {
        pictureCell.previewImage.image = UIImage (named: "pic1")
        print(indexPath.row)
      }else {
        pictureCell.previewImage.image = UIImage (named: "pic2")
      }
      
      
    }
    cell.backgroundColor = .black
    return cell
  }
}

extension PictureViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
    print(indexPath.row)
  }
}

extension PictureViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 90, height: 90)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return marginBetweenCells
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return maxHorizontalCells
  }
}

