//
//  DayViewViewModelTests.swift
//  CloudyTests
//
//  Created by yiqiwang(王一棋) on 2017/12/27.
//  Copyright © 2017年 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class DayViewViewModelTests: XCTestCase {

    var viewModel: DayViewViewModel!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // Load stub
        let data = loadDataFromBundle()
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)

        // Initialize view model
        viewModel = DayViewViewModel(weatherData: weatherData)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()

        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
    }

    // MARK: - Tests for Date

    func testDate() {
        XCTAssertEqual(viewModel.date, "Thu, October 6")
    }

    // MARK: - Tests for Time

    func testTime_TwelveHour() {
        let timeNotation: TimeNotation = .twelveHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)

        XCTAssertEqual(viewModel.time, "05:32 PM")
    }

    func testTime_TwentyFourHour() {
        let timeNotation: TimeNotation = .twentyFourHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)

        XCTAssertEqual(viewModel.time, "17:32")
    }

    // MARK: - Tests for summary

    func testSummary() {
        XCTAssertEqual(viewModel.summary, "Partly Cloudy")
    }

    // MARK: - Tests for Temperature

    func testTemperature_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)

        XCTAssertEqual(viewModel.temperature, "47.5 °F")
    }

    func testTemperature_Celsius() {
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)

        XCTAssertEqual(viewModel.temperature, "8.6 °C")
    }

    // MARK: - Tests for Wind Speed

    func testWindSpeed_Imperial() {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        XCTAssertEqual(viewModel.windSpeed, "9 MPH")
    }

    func testWindSpeed_Metric() {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        XCTAssertEqual(viewModel.windSpeed, "15 KPH")
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

    // MARK: - Helper Methods

    private func loadDataFromBundle() -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: "forecast", withExtension: "json")

        return try! Data(contentsOf: url!)
    }
    
}
