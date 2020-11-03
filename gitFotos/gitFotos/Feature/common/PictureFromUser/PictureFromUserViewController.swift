//
//  PictureFromUserViewController.swift
//  gitFotos
//
//  Created by erick silva teran on 03/11/2020.
//

import Foundation
import UIKit

class PictureFromUserViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.image = #imageLiteral(resourceName: "xO5tGY1NgCU.jpg")
  }
  
  @IBAction func buttonPhoto(_ sender: UIButton) {
    
  }
  
  
  
}


