//
//  WeatherDayRepresentable.swift
//  Cloudy
//
//  Created by yiqiwang(王一棋) on 2017/12/25.
//  Copyright © 2017年 Cocoacasts. All rights reserved.
//

import UIKit

protocol WeatherDayRepresentable {

    var day: String { get }
    var date: String { get }
    var image: UIImage? { get }
    var windSpeed: String { get }
    var temperature: String { get }

}
