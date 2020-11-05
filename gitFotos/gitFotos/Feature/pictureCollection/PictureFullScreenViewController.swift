//
//  PictureFullScreenViewController.swift
//  gitFotos
//
//  Created by erick silva teran on 30/10/2020.
//

import UIKit



class PictureFullScreenViewController: UIViewController {
  
  @IBOutlet weak var textDescription: UITextField!
  
  @IBOutlet weak var textField: UITextField!
  
  @IBOutlet weak var textfieldOutlet: UITextField!
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("sabroooosssooooooooooooonnnnnnnnn")
    print(PicturesViewModel.selectedIndex)
    
  }
  
  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var megustaOutlet: UILabel!
  
    
  
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
    
    ImagesData.setTitle(textField.text!, position: PicturesViewModel.selectedIndex!)
    print(textField.text)
    dismiss(animated: true, completion: nil)
    
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    megustaOutlet.text = "I like it!"
    imageView.image = PicturesViewModel.selectedImage
    //    darle el switch asignado
    updateLikeSwitch()
    
    guard let index: Int = PicturesViewModel.selectedIndex else {return}
    textField.text = ImagesData.getTitle(index)
    
  }
  //  funcion que me dice si es una true o false el switch
  private func updateLikeSwitch() {
    guard let index: Int = PicturesViewModel.selectedIndex else {return}
    
    switchMegusta.isOn = ImagesData.likeForPosition(index)
    
    textDescription.text = ImagesData.getTitle(index)
 
    textDescription.text = ImagesData.likeForPosition(index).description
    textDescription.text = ImagesData.imageForPosition(index)?.description
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
