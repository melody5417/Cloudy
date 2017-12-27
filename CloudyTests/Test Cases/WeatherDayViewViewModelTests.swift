//
//  WeatherDayViewViewModelTests.swift
//  CloudyTests
//
//  Created by yiqiwang(王一棋) on 2017/12/27.
//  Copyright © 2017年 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class WeatherDayViewViewModelTests: XCTestCase {

    var viewModel: WeatherDayViewViewModel!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // Load Stub
        let data = loadDataFromBundle(withName: "forecast", extension: "json")
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)

        // Initialize View Model
        viewModel = WeatherDayViewViewModel(weatherDayData: weatherData.dailyData[5])
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()

        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
    }
    
    // MARK: - Tests for Day

    func testDay() {
        XCTAssertEqual(viewModel.day, "Tuesday")
    }

    // MARK: - Tests for Date

    func testDate() {
        XCTAssertEqual(viewModel.date, "October 11")
    }

    // MARK: - Tests for Temperature

    func testTemperature_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)

        XCTAssertEqual(viewModel.temperature, "38 °F - 58 °F")
    }

    func testTemperature_Celsius() {
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)

        XCTAssertEqual(viewModel.temperature, "3 °C - 14 °C")
    }

    // MARK: - Tests for Wind Speed

    func testWindSpeed_Imperial() {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        XCTAssertEqual(viewModel.windSpeed, "8 MPH")
    }

    func testWindSpeed_Metric() {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        XCTAssertEqual(viewModel.windSpeed, "13 KPH")
    }

    // MARK: - Tests for Image

    func testImage() {
        let viewModelImage = viewModel.image
        let imageDataViewModel = UIImagePNGRepresentation(viewModelImage!)!
        let imageDataReference = UIImagePNGRepresentation(UIImage(named: "cloudy")!)!

        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage!.size.width, 236.0)
        XCTAssertEqual(viewModelImage!.size.height, 172.0)
        XCTAssertEqual(imageDataViewModel, imageDataReference)
    }
    
}
