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

    // MARK: Verificador se textfield recebe apenas dados númericos maiores que zero
    @IBAction func textEditingChanged(_ sender: UITextField) {
        // botão ficará ativo só quando dados forem validados
        startButton.isEnabled = false
        
        guard let textFieldParticipants = textParticipants.text else {
            return
        }
        // certifica que textField será númerico maior que zero
        guard textFieldParticipants.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil, Int(sender.text!) ?? textFieldParticipants.count > 0 else {
            return
        }
        // habilita o botão
        startButton.isEnabled = true
        
    }
    
    // MARK: Abre tela de termos
    @IBAction func termsOnClick(_ sender: UIButton) {
        let termsViewController = TermsViewController(nibName: "TermsViewController", bundle: nil)
        
        present(termsViewController, animated: true)
        
    }
    
    // MARK: Direciona para a ActivitiesViewController
    @IBAction func startsActivities(_ sender: UIButton) {
        guard let textField = textParticipants.text, textField != "" else {
            return startButton.isEnabled = false
        }
        
        let activities = ActivitiesViewController()
        activities.modalPresentationStyle = .fullScreen
        show(activities, sender: startButton)
        
    }
}


