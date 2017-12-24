//
//  SettingsViewTimeViewModel.swift
//  Cloudy
//
//  Created by melody5417 on 24/12/2017.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewTimeViewModel {
    
    // MARK: - Properties
    
    let timeNotation: TimeNotation
    
    // MARK: - Public Interface
    
    var text: String {
        switch timeNotation {
        case .twelveHour:
            return "12 Hour"
        case .twentyFourHour:
            return "24 Hour"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.timeNotation() == timeNotation {
            return .checkmark
        } else {
            return .none
        }
    }
    
}
