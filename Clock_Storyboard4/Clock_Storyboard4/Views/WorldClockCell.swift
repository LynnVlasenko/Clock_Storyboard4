//
//  WorldClockCell.swift
//  Clock_Storyboard3
//
//  Created by Алина Власенко on 23.01.2023.
//

import UIKit

//клас ідентифікатор для комірки таблиці який налаштовує UI комірки
class WorldClockCell: UITableViewCell {

    //створюємо UI елементи для таблиці екрану "Час у світі"
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var timeZoneHoursLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    //створюємо сетер, що записує дані кожного елемента
    var worldClock: WorldClock? {
      didSet {
        guard let worldClock = worldClock else { return }

          cityLabel.text = worldClock.city
          timeZoneHoursLabel.text = worldClock.timeZoneHours
          timeLabel.text = worldClock.time
      }
    }
    
    //автоматичто створена функція при створенні файла через Cocoa Touch Class (поки не дуже розумію функціональність)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
