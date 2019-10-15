//
//  NewCarTableViewController.swift
//  CarInfo
//
//  Created by Maks on 13/10/2019.
//  Copyright © 2019 Maks. All rights reserved.
//

import UIKit

class NewCarTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
}

    



}

extension NewCarTableViewController: UITextFieldDelegate {
    //    hide keyboard????????
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
