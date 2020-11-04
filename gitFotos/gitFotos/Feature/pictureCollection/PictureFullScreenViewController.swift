//
//  PictureFullScreenViewController.swift
//  gitFotos
//
//  Created by erick silva teran on 30/10/2020.
//

import UIKit



class PictureFullScreenViewController: UIViewController {
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("didAppearfullscreen")
    print(PicturesViewModel.selectedIndex)
    
  }
  
  @IBOutlet weak var imageView: UIImageView!
  
  
  @IBAction func actionSwitch(_ sender: Any) {
    
    guard let index: Int = PicturesViewModel.selectedIndex else {return}
    
    if switchMegusta.isOn == true {
      ImagesData.likeImageAtPosition(index)
      print("encendido")
    } else if switchMegusta.isOn == false {
      ImagesData.dislikeImageAtPosition(index)
      print("apagado")
    }
    
  }
  
  @IBOutlet weak var switchMegusta: UISwitch!
  
  
  
  @IBAction func xButton(_ sender: Any) {
    
    dismiss(animated: true, completion: nil)
    
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    imageView.image = PicturesViewModel.selectedImage
    //    darle el switch asignado
    updateLikeSwitch()
    
  }
  //  funcion que me dice si es una true o false el switch
  private func updateLikeSwitch() {
    guard let index: Int = PicturesViewModel.selectedIndex else {return}
    
    switchMegusta.isOn = ImagesData.likeForPosition(index)
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
