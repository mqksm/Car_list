//
//  NewCarTableViewController.swift
//  CarInfo
//
//  Created by Maks on 13/10/2019.
//  Copyright © 2019 Maks. All rights reserved.
//

import UIKit

class NewCarTableViewController: UITableViewController {

    

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var brandField: UITextField!
    @IBOutlet weak var colorField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    
//    let bodyTypes = ["Sedan", "Coupe", "Hatchback", "Minivan", "Truck", "Station Wagon", "Convertible"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        typeLabel.text = BodyType.cases.first
        tableView.tableFooterView = UIView() // убираем нижние ячейки
    }
    
    
  //    Hide the keyboard and checking fills of all fields
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
        if brandField.text?.isEmpty == false && modelField.text?.isEmpty == false && colorField.text?.isEmpty == false && yearField.text?.isEmpty == false{
                    saveButton.isEnabled = true
        }
        else { saveButton.isEnabled = false }
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    

    func saveCar() {
        
        guard let brand = brandField.text, let model = modelField.text, let color = colorField.text, let year = yearField.text, let body = typeLabel.text  else {
            return
        }
        
        let newCar = Car(brand: brand, year: year, model: model, body: body, color: color)
        
        StorageManager.saveObject(newCar)
        
        
        }
    
}


extension NewCarTableViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return BodyType.cases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return BodyType.cases[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeLabel.text = BodyType.cases[row]
    }
}
