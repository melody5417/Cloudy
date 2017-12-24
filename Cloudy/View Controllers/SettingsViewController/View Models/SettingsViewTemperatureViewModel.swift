//
//  SettingsViewTemperatureViewModel.swift
//  Cloudy
//
//  Created by melody5417 on 24/12/2017.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewTemperatureViewModel: SettingsRepresentable {
    
    // MARK: - Properties
    
    let temperatureNotation: TemperatureNotation
    
    // MARK: - Public Interface
    
    var text: String {
        switch temperatureNotation {
        case .fahrenheit: return "Fahrenheit"
        case .celsius: return "Celsius"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.temperatureNotation() == temperatureNotation {
            return .checkmark
        } else {
            return .none
        }
    }
    
}
