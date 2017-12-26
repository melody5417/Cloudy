//
//  WeekViewViewModel.swift
//  Cloudy
//
//  Created by melody5417 on 24/12/2017.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import UIKit

struct WeekViewViewModel {
    
    // MARK: - Properties
    
    let weatherData: [WeatherDayData]
    
    // MARK: - Public Interface
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfDays: Int {
        return weatherData.count
    }
    
    // MARK: -

    func viewModel(for index: Int) -> WeatherDayRepresentable {
        return WeatherDayViewViewModel(weatherDayData: weatherData[index])
    }
    
}
