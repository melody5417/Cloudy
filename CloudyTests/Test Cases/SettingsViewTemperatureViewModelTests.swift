//
//  SettingsViewTemperatureViewModelTests.swift
//  CloudyTests
//
//  Created by yiqiwang(王一棋) on 2017/12/27.
//  Copyright © 2017年 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewTemperatureViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Tests for Text

    func testText_Fahrenheit() {
        let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: .fahrenheit)

        XCTAssertEqual(viewModel.text, "Fahrenheit")
    }

    func testText_Celsius() {
        let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: .celsius)

        XCTAssertEqual(viewModel.text, "Celsius")
    }

    // MARK: - Tests for Accessory Type

    func testAccessoryType_Fahrenheit_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)

        let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: .fahrenheit)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }

    func testAccessoryType_Fahrenheit_Celsius() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)

        let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: .celsius)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }

    func testAccessoryType_Celsius_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)

        let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: .fahrenheit)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }

    func testAccessoryType_Celsius_Celsius() {
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)

        let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: .celsius)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }
    
}
