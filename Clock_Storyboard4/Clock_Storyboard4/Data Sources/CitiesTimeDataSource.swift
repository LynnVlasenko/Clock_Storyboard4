//
//  CitiesTimeDataSource.swift
//  Clock_Storyboard1
//
//  Created by Алина Власенко on 23.01.2023.
//

import UIKit

//створюємо клас для додавання нового міста з поточним часов у список на єкрані "Час у світі"
class CitiesTimeDataSource: NSObject {
  // MARK: - Properties
  var cities = [
    "Нью-Йорк",
    "Париж"
  ]

  var selectedCity: String? {
    didSet {
      if let selectedCity = selectedCity,
        let index = cities.firstIndex(of: selectedCity) {
        selectedCityIndex = index
      }
    }
  }

  var selectedCityIndex: Int?

  // MARK: - Datasource Methods
  func selectCity(at indexPath: IndexPath) {
    selectedCity = cities[indexPath.row]
  }

  func numberOfCity() -> Int {
    cities.count
  }

  func cityName(at indexPath: IndexPath) -> String {
    cities[indexPath.row]
  }
}
