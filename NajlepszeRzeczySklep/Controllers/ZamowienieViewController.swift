//
//  ZamowienieViewController.swift
//  NajlepszeRzeczySklep
//
//  Created by Mariusz Dziuba on 19/03/2023.
//

import UIKit

class ZamowienieViewController: UIViewController {
    
    var imieWprowadzone: String?
    var nazwiskoWprowadzone: String?
    var adresWprowadzone: String?
    var emailWprowadzone: String?
    var telefonWprowadzone: String?
    
    
    @IBOutlet weak var imieOdbiorcyTF: UITextField!
    @IBOutlet weak var nazwiskoOdbiorcyTF: UITextField!
    
    @IBOutlet weak var telefonTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var adres2TF: UITextField!
    
    @IBOutlet weak var brakDanychInfo: UILabel!
    @IBOutlet weak var adres1tF: UITextField!
    @IBAction func dalejButtonPressed(_ sender: UIButton) {
        
        if let imie = imieOdbiorcyTF.text {
            imieWprowadzone = imie
            if let nazwisko = nazwiskoOdbiorcyTF.text {
                nazwiskoWprowadzone = nazwisko
                if let adres = adres1tF.text {
                    adresWprowadzone = adres
                    adresWprowadzone = "\(adresWprowadzone!) \(adres2TF.text ?? "")"
                    if let email = emailTF.text {
                        emailWprowadzone = email
                        if let telefon = telefonTF.text {
                            telefonWprowadzone = telefon
                            if telefonWprowadzone != "", nazwiskoWprowadzone != "", adresWprowadzone != "", emailWprowadzone != "", imieWprowadzone != "" {
                                performSegue(withIdentifier: "DoOstatniej", sender: self)
                            }
                        }
                    }
                }
            }
        }
        brakDanychInfo.textColor = .red
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
