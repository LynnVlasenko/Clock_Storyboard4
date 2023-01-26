//
//  CityPickerViewController.swift
//  Clock_Storyboard4
//
//  Created by Алина Власенко on 24.01.2023.
//

import UIKit

class CityPickerViewController: UITableViewController {
  let cityTimeDataSource = CitiesTimeDataSource()
    
    //коли перетягую citiesLabel на назву міста у списку6 щоб обрати - то помилка
    @IBOutlet weak var citiesLabel: UILabel!
    
    var timeOfCity: WorldClock?
    
    var city = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
      if segue.identifier == "SaveCityDetail",
         let cityName = citiesLabel.text {
          timeOfCity = WorldClock(city: cityName, timeZoneHours: "Сьогодні", time: "00:00")
      }
    
      if segue.identifier == "PickCity",
         let cityPickerViewController = segue.destination as? CityPickerViewController {
          cityPickerViewController.cityTimeDataSource.selectedCity = city
      }
    }

}

//розширення, яке повертає на екран "Час у світі" коли натискаю на місто, щоб додати на екран
extension CityPickerViewController {
  @IBAction func unwindWithSelectedGame(segue: UIStoryboardSegue) {
    if let cityPickerViewController = segue.source as? CityPickerViewController,
       let selectedCity = cityPickerViewController.cityTimeDataSource.selectedCity {
       city = selectedCity
    }
  }
}

extension CityPickerViewController {
  override func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    cityTimeDataSource.numberOfCity()
  }

  override func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
    cell.textLabel?.text = cityTimeDataSource.cityName(at: indexPath)

      if indexPath.row == cityTimeDataSource.selectedCityIndex {
        cell.accessoryType = .checkmark
      } else {
        cell.accessoryType = .none
      }
      
    return cell
  }
}

extension CityPickerViewController {
  override func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    // 1
    tableView.deselectRow(at: indexPath, animated: true)
    // 2
    if let index = cityTimeDataSource.selectedCityIndex {
      let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
      cell?.accessoryType = .none
    }
    // 3
      cityTimeDataSource.selectCity(at: indexPath)
    // 4
    let cell = tableView.cellForRow(at: indexPath)
    cell?.accessoryType = .checkmark
    
    performSegue(withIdentifier: "unwind", sender: cell)
  }
}
