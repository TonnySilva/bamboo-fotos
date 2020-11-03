//
//  PictureFromUserViewController.swift
//  gitFotos
//
//  Created by erick silva teran on 03/11/2020.
//

import Foundation
import UIKit
import Photos

class PictureFromUserViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate {
  
  
  @IBOutlet weak var imageView: UIImageView!
  
  
  var imagePicker: UIImagePickerController = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func buttonPhoto(_ sender: UIButton) {
//    otra solucion para agregar galeria con funciones
//  openGallary()
  
    
    
    if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
      imagePicker.delegate = self
      imagePicker.sourceType = .savedPhotosAlbum
      imagePicker.allowsEditing = true

      present(imagePicker, animated: true, completion: nil)
    }
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    
    let tempImage:UIImage? = info[.editedImage] as? UIImage
    imageView.image = tempImage

//    ocultar pantalla cuando se selecciona la imagen con el dismiss
    dismiss(animated: true, completion: nil)
    
    print("imagepicker")
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: false, completion: nil)
    
    print("cancel")
  }
  
  
//  otra solucion de agregar galeria en el boton mediante funciones.
//  func openGallary() {
//
//    imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
//    imagePicker.allowsEditing = true
////    cr4eacioin de guard xq tenia ? el ppicker, no hace falta en este ejemplo.
////    guard let picker = imagePicker else {return }
//
//    self.present(imagePicker, animated: true, completion: nil)
//
//  }
  
}



