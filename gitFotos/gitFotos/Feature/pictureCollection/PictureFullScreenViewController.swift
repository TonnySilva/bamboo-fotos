//
//  PictureFullScreenViewController.swift
//  gitFotos
//
//  Created by erick silva teran on 30/10/2020.
//

import UIKit



class PictureFullScreenViewController: UIViewController {
  
  

  @IBOutlet weak var imageView: UIImageView!
  
  
  @IBAction func actionSwitch(_ sender: Any) {


    print(switchMegusta.isOn)
  }
  
  
  @IBOutlet weak var switchMegusta: UISwitch!
  

  
  @IBAction func xButton(_ sender: Any) {
    
    dismiss(animated: true, completion: nil)
    
  }
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

    imageView.image = PicturesViewModel.selectedImage
    
    
        // Do any additional setup after loading the view.
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
