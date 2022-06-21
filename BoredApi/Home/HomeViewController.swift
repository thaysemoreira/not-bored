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
    @IBOutlet weak var participantsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startButtonOnClick(_ sender: UIButton) {
        print(textParticipants.text ?? "Blank")
    }
    
    @IBAction func startsActivities(_ sender: UIButton) {
            let activities = ActivityTableViewController()
            
            show(activities, sender: startButton)
            
        }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        // botão ficará ativo só quando dados forem validados
        startButton.isEnabled = false
        
        guard let textField = textParticipants.text, textField != "" else {
            return
        }
        
        //certifica que o textField será númerico
        guard textField.rangeOfCharacter(from: NSCharacterSet(charactersIn:"0123456789").inverted) == nil else {
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


