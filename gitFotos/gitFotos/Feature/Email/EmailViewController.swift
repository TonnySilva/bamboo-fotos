//
//  EmailViewController.swift
//  gitFotos
//
//  Created by erick silva teran on 05/11/2020.
//

import UIKit
import MessageUI


class EmailViewController: UIViewController, MFMailComposeViewControllerDelegate {
  //  botton de Enviar, me envia al correo
  
  @IBAction func buttonEnviar(_ sender: Any) {
    
    if MFMailComposeViewController.canSendMail() {
    
      let mail = MFMailComposeViewController()
      mail.mailComposeDelegate = self
      mail.setToRecipients([emailText.text ?? ""])
      mail.setMessageBody("hola \(nameText.text ?? "")", isHTML: false)
    
      
      present(mail, animated: true)
      
    }
    
  }
  
  
  //  primero creo la etiqueta donde guardo el string de nombre y email
  private let nameEmailKey: String = "MyNameAndEmailKey"
  //lista de strings
  private var listOfEmails: [String] = []
  //
  @IBOutlet weak var nameText: UITextField!
  
  @IBOutlet weak var emailText: UITextField!
  
  @IBOutlet weak var textView: UITextView!
  
  //  accion boton reset
  @IBAction func resetButton(_ sender: UIButton) {
    
    ////    eliminar datos solucion , al picar reset sin alerta
    //    UserDefaults.standard.removeObject(forKey: nameEmailKey)
    ////    synchronize es para que lo elimine al momento de apretar el reset.
    //    UserDefaults.standard.synchronize()
    
    //   creacion de alerta
    
    let alert = UIAlertController(title: "CUIDADO!", message: "Estas seguro que quieres borrar?", preferredStyle: UIAlertController.Style.actionSheet)
    
    //accion de eliminar con el boton Si
    let action = UIAlertAction(title: "Destructive!", style: UIAlertAction.Style.destructive, handler:
                                { action in
                                  UserDefaults.standard.removeObject(forKey: self.nameEmailKey)
                                  UserDefaults.standard.synchronize()
                                  print("el usuario ha eliminado los datos")
                                })
    alert.addAction(action)
    //    no eliminar los datos con el boton NO
    let cancelAction = UIAlertAction(title: "Cancel!", style: UIAlertAction.Style.cancel, handler: //nil o tmbn puedo poner prints //
                                      {action in
                                        print("No elimino los datos")
                                      })
    alert.addAction(cancelAction)
    
    let defaultAction = UIAlertAction(title: "Default!", style: UIAlertAction.Style.default, handler: //nil o tmbn puedo poner prints //
                                        {action in
                                          print("No elimino los datos")
                                        })
    alert.addAction(defaultAction)
    
    self.present(alert, animated: true, completion: nil)
    
    
  }
  
  //  accion del boton
  @IBAction func guardarButtonAction(_ sender: Any) {
    
    guard let nombreTexto: String = nameText.text,
          let emailDeTexto: String = emailText.text else {return}
    
    let fullString: String = "\(nombreTexto);\(emailDeTexto)"
    //    UserDefaults.standard.set( fullString, forKey: nameEmailKey)
    
    //agregar lista de string a fullstring
    listOfEmails.append(fullString)
    
    ////    guardar lista de strings
    //    let lista: [String] = ["nombre 1 , email 1" , "emailDeTexto"]
    
    
    UserDefaults.standard.set(listOfEmails, forKey: nameEmailKey)
    UserDefaults.standard.synchronize()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //
    //    if let storedValue: String = UserDefaults.standard.string(forKey: nameEmailKey) {
    //      textView.text.append("\n" + storedValue)
    //
    //      print("Stored value: \(storedValue)")
    //    }
    //      creacion de una lista
    
    if let storedEmails: [String] = UserDefaults.standard.stringArray(forKey: nameEmailKey) {
      listOfEmails.append(contentsOf: storedEmails)
      for namemail in listOfEmails {
        textView.text.append("\n" + namemail)
        print(namemail)
      }
      print("Stored value: \(storedEmails)")
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
