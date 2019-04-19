//
//  ViewController.swift
//  SimpleQR
//
//  Created by jmhdevelop on 04/19/2019.
//  Copyright (c) 2019 jmhdevelop. All rights reserved.
//

import UIKit
import SimpleQR

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func buttonGenerate(_ sender: Any) {
        if let text = textField.text, !text.isEmpty {
            imageView.image = SimpleQR.shared.imageQR(text)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

