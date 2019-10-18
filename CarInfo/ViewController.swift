//
//  ViewController.swift
//  CarInfo
//
//  Created by Maks on 12/10/2019.
//  Copyright © 2019 Maks. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    @IBOutlet weak var tableView: UITableView!
    
    var cars: [Car]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        isAppAlreadyLaunchedOnce()
        cars = Array(realm.objects(Car.self).reversed())
        tableView.backgroundColor = UIColor.lightGray
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView() // убираем нижние ячейки
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.isEmpty ? 0 : cars.count
      }
      
// Заполнение ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let car = cars[indexPath.row]
        
        cell.textLabel?.text = car.brand + " " + car.model
        cell.detailTextLabel?.text = "Color: " + car.color + "; Type: " + car.body + "; Year: " + String(car.year)
        return cell
      }
            
// Удаление свайпом
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let car = cars[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completion in
        
        StorageManager.deleteObject(car)
        completion(true)
        self?.cars.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
//        tableView.reloadData()
      }
      return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let car = cars[indexPath.row]
            let newCarVC = segue.destination as! NewCarTableViewController
            newCarVC.currentCar = car
        }
    }

    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue ){
        guard let newCarVC = segue.source as? NewCarTableViewController else {return}
        newCarVC.saveCar()
        cars = Array(realm.objects(Car.self).reversed())
        tableView.reloadData()

    }
    
//  Предзагрузка автомобилей при первом запуске приложения
    func isAppAlreadyLaunchedOnce(){
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: "isAppAlreadyLaunchedOnce"){
        }else{
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
            let firstCar = Car(brand: "Honda", year: "2007", model: "Civic", body: "Hatchback", color: "Black")
            let secondCar = Car(brand: "Audi", year: "2010", model: "A5", body: "Coupe", color: "Red")
            let thirdCar = Car(brand: "BMW", year: "2019", model: "X7", body: "Hatchback", color: "Blue")
            StorageManager.saveObject(firstCar)
            StorageManager.saveObject(secondCar)
            StorageManager.saveObject(thirdCar)
        }
    }

}

