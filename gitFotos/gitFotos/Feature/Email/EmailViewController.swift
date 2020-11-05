//
//  EmailViewController.swift
//  gitFotos
//
//  Created by erick silva teran on 05/11/2020.
//

import UIKit

class EmailViewController: UIViewController {
  
  @IBOutlet weak var nameText: UITextField!
  
  @IBOutlet weak var emailText: UITextField!
  
  @IBOutlet weak var buttonGuardarOutlet: UIButton!
  
  @IBOutlet weak var textView: UITextView!
  
  
  //  accion del boton
  @IBAction func guardarButtonAction(_ sender: Any) {
    
    //
    guard let nombreTexto: String = nameText.text,
          let emailDeTexto: String = emailText.text else {return}
    
    let fullString: String = "\(nombreTexto);\(emailDeTexto)"
    UserDefaults.standard.set(fullString, forKey: nameEmailKey)
    
  }
  //  primero creo la etiqueta donde guardo el string de nombre y email
  private let nameEmailKey: String = "MyNameAndEmailKey"
  //
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //    guard let emailDeTexto: String = emailText.text else {return}
    //
    //    guard let nombreTexto: String = nameText.text else {return}
    //
    //    UserDefaults.standard.set(true, forKey: nombreTexto)
    
    
    if let storedValue: String = UserDefaults.standard.string(forKey: nameEmailKey) {
      textView.text.append("\n" + storedValue)
      print("Stored value: \(storedValue)")
      
    }
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
