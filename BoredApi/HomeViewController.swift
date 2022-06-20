//
//  HomeViewController.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 17/06/22.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textParticipants: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var termsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startButtonOnClick(_ sender: UIButton) {
        print(textParticipants.text ?? "Blank")
    }
    @IBAction func textEditingChanged(_ sender: Any) {
        // botão ficará ativo se os dados quando os dados forem validados
        startButton.isEnabled = false
        
        //certifica que o textField será númerico
        guard let textField = textParticipants.text, textField.rangeOfCharacter(from: NSCharacterSet(charactersIn:"0123456789").inverted) == nil else {
            return
        }
        
        // habilita o botão
        startButton.isEnabled = true
        
    }
    
    @IBAction func termsOnClick(_ sender: UIButton) {
        let termsViewController = TermsViewController(nibName: "TermsViewController", bundle: nil)
        
        present(termsViewController, animated: true)
        
    }
    
}


