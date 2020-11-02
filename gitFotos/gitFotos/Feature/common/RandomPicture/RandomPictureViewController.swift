//
//  RandomPictureViewController.swift
//  gitFotos
//
//  Created by erick silva teran on 02/11/2020.
//

import UIKit

class RandomPictureViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
//      asignar una imagen aleatoria
      let randomNumber = Int.random(in: 0 ... ImagesData.numOfImages())
      
      let img:UIImage? = ImagesData.imageForPosition(randomNumber)
      
      imageView.image = img
      
      print("randomNumber: \(randomNumber)")
    }
  func getRandomPicture() -> UIImage? {
    let randomNumber = Int.random(in: 0 ... ImagesData.numOfImages())
    let img:UIImage? = ImagesData.imageForPosition(randomNumber)

  return img
  }
      
      
        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
