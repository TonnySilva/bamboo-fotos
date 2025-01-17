//
//  PicturesViewController.swift
//  gitFotos
//
//  Created by erick silva teran on 26/10/2020.
//

import Foundation
import UIKit


class PictureViewController: UIViewController  {
  
  
  
  
  //  creacion variables de las medidas de las pantallas
  //  var cellWidth: CGFloat = 50
  //  var cellHeight: CGFloat = 50
  
  
  //  creacion botones de accion
  
  @IBAction func butonYears(_ sender: UIButton) {
    print("Years")
    
    numOfHorizontalCells = 1
    //    cellWidth = 50
    //    cellHeight = 50
    collectionView.reloadData()
    
    selectButon(sender)
  }
  @IBAction func butonMonths(_ sender: UIButton) {
    print("Months")
    
    //    cellWidth = 100
    //    cellHeight = 100
    numOfHorizontalCells = 3
    collectionView.reloadData()
    
    selectButon(sender)
  }
  
  @IBAction func butonDays(_ sender: UIButton) {
    print("Days")
    
    //    cellWidth = 150
    //    cellHeight = 150
    numOfHorizontalCells = 5
    collectionView.reloadData()
    
    selectButon(sender)
  }
  @IBAction func butonPhotos(_ sender: UIButton) {
    print("photos")
    
    //    cellWidth = 200
    //    cellHeight = 200
    numOfHorizontalCells = 7
    collectionView.reloadData()
    
    selectButon(sender)
  }
  //  total de los botones creados en una funcion
  func selectButon(_ sender: UIButton){
    outletYears.isSelected = false
    outletMonths.isSelected = false
    outletDays.isSelected = false
    outletPhotos.isSelected = false
    
    sender.isSelected = true
  }
  
  
  @IBOutlet weak var stackViewButons: UIStackView!
  
  //  creacion outlet de los botones
  
  @IBOutlet weak var outletYears: UIButton!
  @IBOutlet weak var outletMonths: UIButton!
  @IBOutlet weak var outletDays: UIButton!
  @IBOutlet weak var outletPhotos: UIButton!
  
  //
  
  
  var numOfHorizontalCells: CGFloat = 2.0
  var marginBetweenCells: CGFloat = 5.0
  
  private let reuseIdentifier = String(describing: PicturesCell.self) //pictures cell
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    // sirve para cargar el .xib en la constante
    let nib = UINib(nibName: reuseIdentifier, bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    super.viewDidLoad()
    
    
  }
  //como saber si el movil esta en vertical u horizontal.
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    
    //    cambiar scroll a horizontal cuando el movil esta en landscape
    //      otra solucion para cambiar scroll usando el guard let
    //    guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {return}
    //solucion if let para cambiar scroll
    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      //
      
      if UIDevice.current.orientation.isLandscape {
        layout.scrollDirection = .horizontal
        print("Landscape")
        
      } else if UIDevice.current.orientation.isPortrait {
        
        layout.scrollDirection = .vertical
        print("Portrait")
      }
    }
  }
  //
}
extension PictureViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return ImagesData.numOfImages()
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    if let pictureCell = (cell as? PicturesCell) {
      //      añado fotos de carpeta
      pictureCell.previewImage.image = ImagesData.imageForPosition(indexPath.row)
      //
      
      //      asignar un numero a cada celda
      pictureCell.titleLabel.text = "\(indexPath.row)"
      //      poner 2imagen marron - segunda opcion de poner imagen la k esta en //2
      //      pictureCell.previewImage.image = UIImage (named: "pic2")
      //            2 pictureCell.previewImage.image = #imageLiteral(resourceName: "pic2")
      
      //      imagen verde e imagen marron alternadas
      //      indexpathrow par o impar
      //      2solucion alternativas
      //     solucion 1
      //      pictureCell.previewImage.image = indexPath.row % 2 == 0 ? UIImage(named: "pic1") : UIImage(named: "pic2")
      //      solucion 2
      if indexPath.row % 2 == 0 {
        //        comentada porque ahora le agrego fotos de la carpeta
        //        pictureCell.previewImage.image = UIImage (named: "pic1")
        
        print(indexPath.row)
      }else {
        //        pictureCell.previewImage.image = UIImage (named: "pic2")
        
      }
      
      
    }
    cell.backgroundColor = .black
    
    stackViewButons.layer.cornerRadius = 30
    return cell
  }
  
}

extension PictureViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
    print(indexPath.row)
    //    asignando una posicion de la celda seleccionada en el picturefullscreen al darle clic y abrir la nueva pantalla
    PicturesViewModel.selectedImage =  ImagesData.imageForPosition(indexPath.row)
    //
//
    PicturesViewModel.selectedIndex = indexPath.row
//    
    performSegue(withIdentifier: "segueToDetail", sender: nil)
  }
}


extension PictureViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let cellWidth = (collectionView.frame.size.width - (numOfHorizontalCells-1)*marginBetweenCells) / numOfHorizontalCells
    
    return CGSize(width: cellWidth, height: cellWidth)
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return marginBetweenCells
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return marginBetweenCells
  }
}

