//
//  TimelistDataSource.swift
//  Clock_Storyboard1
//
//  Created by Алина Власенко on 23.01.2023.
//

import UIKit

//клас, що створює дані і відображає список міст з поточним часом
class WorldClockDataSource: NSObject {
    // MARK: - Properties
    var timelist: [WorldClock]
    
    static func generateWorldClockData() -> [WorldClock] { //повертаємо масив властивостей структури WorldClock у вигляді дікшинарі
        return [
            WorldClock(city: "Київ", timeZoneHours: "Сьогодні, +1 год", time: "00:00"),
            WorldClock(city: "Лісабон", timeZoneHours: "Сьогодні, -1 год", time: "00:00"),
        ]
    }
    
    // MARK: - Initializers
    //інітимо дані з функції
    override init() {
        timelist = WorldClockDataSource.generateWorldClockData()
    }
    
    //функція що передає кількість рядків
    func numberOfWorldClock() -> Int {
        timelist.count
    }

    //функція, що додає елементи таблиці у вигляді рядків даних з timelist
    func append(timelists: WorldClock, to tableView: UITableView) {
        timelist.append(timelists)
        tableView.insertRows(at: [IndexPath(row: timelist.count-1, section: 0)], with: .automatic)
    }

    //функція, що достукується до рядка даних з масива словників
    func timelist(at indexPath: IndexPath) -> WorldClock {
        timelist[indexPath.row]
    }
}
