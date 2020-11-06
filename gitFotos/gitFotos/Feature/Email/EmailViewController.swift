//
//  EmailViewController.swift
//  gitFotos
//
//  Created by erick silva teran on 05/11/2020.
//

import UIKit

class EmailViewController: UIViewController {
  
  //  primero creo la etiqueta donde guardo el string de nombre y email
  private let nameEmailKey: String = "MyNameAndEmailKey"
  //
  
  @IBOutlet weak var nameText: UITextField!
  
  @IBOutlet weak var emailText: UITextField!
  
  @IBOutlet weak var textView: UITextView!
  
//  accion boton reset
  @IBAction func resetButton(_ sender: UIButton) {
    
////    eliminar datos solucion
//    UserDefaults.standard.removeObject(forKey: nameEmailKey)
////    synchronize es para que lo elimine al momento de apretar el reset.
//    UserDefaults.standard.synchronize()
    
//    alerta

     let alert = UIAlertController(title: "CUIDADO!", message: "Estas seguro que quieres borrar?", preferredStyle: UIAlertController.Style.alert)
    
//accion de eliminar con el boton Si
    let action = UIAlertAction(title: "Si", style: UIAlertAction.Style.destructive, handler:
                                { action in
                                  UserDefaults.standard.removeObject(forKey: self.nameEmailKey)
                                  UserDefaults.standard.synchronize()
                                  print("el usuario ha eliminado los datos")
                                })
    alert.addAction(action)
//    no eliminar los datos con el boton NO
    let cancelAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: //nil o tmbn puedo poner prints //
                                      {action in
                                        print("No elimino los datos")
                                      }
                                     )
    alert.addAction(cancelAction)
    
    

      self.present(alert, animated: true, completion: nil)
    
    
  }
  
  //  accion del boton
  @IBAction func guardarButtonAction(_ sender: Any) {
    
    guard let nombreTexto: String = nameText.text,
          let emailDeTexto: String = emailText.text else {return}
    
    let fullString: String = "\(nombreTexto);\(emailDeTexto)"
    UserDefaults.standard.set(fullString, forKey: nameEmailKey)
    
   
  }

  
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
