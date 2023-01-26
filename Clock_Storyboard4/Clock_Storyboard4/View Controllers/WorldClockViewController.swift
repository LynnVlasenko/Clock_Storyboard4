//
//  WorldClockViewController.swift
//  Clock_Storyboard3
//
//  Created by Алина Власенко on 23.01.2023.
//

import UIKit

//створюємо клас ViewController для відображення таблиці на екрані
class WorldClockViewController: UITableViewController {
  var timelistDataSource = WorldClockDataSource()
}

//прописуємо розширення з обов'язковими функціями для табличного відображення
extension WorldClockViewController {
  override func tableView( //функція, що передає кількість комірок у таблиці
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
      timelistDataSource.numberOfWorldClock()
  }

  override func tableView(  //функція, яка створює та повертає комірку за ідентифікатором, який був встановлений раніше.
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "WorldClockCell",
      for: indexPath) as! WorldClockCell
      
      cell.worldClock = timelistDataSource.timelist(at: indexPath)

    return cell
  }
}



extension WorldClockViewController {

  @IBAction func saveCityDetail(_ segue: UIStoryboardSegue) {
    guard
      let cityPickerViewController = segue.source as? CityPickerViewController,
      let citySave = cityPickerViewController.timeOfCity
      else {
        return
    }
      timelistDataSource.append(timelists: citySave, to: tableView)

  }
}


//extension WorldClockViewController {
//
//}
