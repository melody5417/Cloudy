//
//  SettingsViewUnitsViewModel.swift
//  Cloudy
//
//  Created by melody5417 on 24/12/2017.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewUnitsViewModel {
    
    // MARK: - Properties
    
    let unitsNotation: UnitsNotation
    
    // MARK: - Public Interfaces
    
    var text: String {
        switch unitsNotation {
        case .imperial: return "Imperial"
        case .metric: return "Metric"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.unitsNotation() == unitsNotation {
            return .checkmark
        } else {
            return .none
        }
    }
        
}
