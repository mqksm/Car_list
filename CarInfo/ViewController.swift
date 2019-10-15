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
    
    
//    var cars = Car.getCars()
    var cars: [Car]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cars = Array(realm.objects(Car.self).reversed())
        tableView.backgroundColor = UIColor.lightGray
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView() // убираем нижние ячейки
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.isEmpty ? 0 : cars.count
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let car = cars[indexPath.row]
        

        cell.textLabel?.text = car.brand + " " + car.model

        cell.detailTextLabel?.text = "Color: " + car.color + "; Type: " + car.body + "; Year: " + String(car.year)
        return cell
      }
      
//      cell.textLabel?.text = cars[indexPath.row].brand + " " + cars[indexPath.row].model
//
//      cell.detailTextLabel?.text = "Color: " + cars[indexPath.row].color + "; Type: " + cars[indexPath.row].body + "; Year: " + String(cars[indexPath.row].year)
//      return cell
//    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue ){
        guard let newCarVC = segue.source as? NewCarTableViewController else {return}
        
//        guard let newCar = newCarVC.saveCar() else {return}
        newCarVC.saveCar()
        cars = Array(realm.objects(Car.self).reversed())
        
        tableView.reloadData()
//        tableView.insertRows(at: [IndexPath(row: 0, section: 0)],
//                             with: UITableView.RowAnimation.top)
    }
    


}

