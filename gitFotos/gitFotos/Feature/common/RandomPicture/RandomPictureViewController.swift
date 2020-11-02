//
//  RandomPictureViewController.swift
//  gitFotos
//
//  Created by erick silva teran on 02/11/2020.
//

import UIKit

class RandomPictureViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  var timer: Timer = Timer()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      refreshPicture()
      
//     solucion 1 temporizador con cambio de imagen
//    timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(refreshPicture), userInfo: nil, repeats: true)
      
//      solucion 2 crear el temporizador con cambio de imagen
    
//      Timer.scheduledTimer(withTimeInterval: 4.0,
//                           repeats: true,
//                           block: { _ in
//                            self.refreshPicture()
//                            print("hola")
//                          })
//
//      asignar una imagen aleatoria
      
//      let randomNumber = Int.random(in: 0 ... ImagesData.numOfImages())
//
//      let img:UIImage? = ImagesData.imageForPosition(randomNumber)
//
//      imageView.image = img
//
//      print("randomNumber: \(randomNumber)")
    }
  func getRandomPicture() -> UIImage? {
    let minPictureIndex: Int = 0
    let maxPictureIndex: Int = ImagesData.numOfImages() - 1
    let randomIndex = Int.random(in: minPictureIndex ... maxPictureIndex)
    let image: UIImage? = ImagesData.imageForPosition(randomIndex)

  return image
  }
  @objc func refreshPicture() {
    imageView.image = getRandomPicture()
    
    
    UIView.transition(with: imageView ,
                      duration: 1.0,
                      options: .transitionFlipFromTop,
                      animations: {
                        self.imageView.image = self.getRandomPicture()
                      },
                      completion: nil)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("Appear")
    
    timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(refreshPicture), userInfo: nil, repeats: true)

  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("Desappear")
    timer.invalidate()
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
