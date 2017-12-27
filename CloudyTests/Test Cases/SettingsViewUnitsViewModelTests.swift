//
//  SettingsViewUnitsViewModelTests.swift
//  CloudyTests
//
//  Created by yiqiwang(王一棋) on 2017/12/27.
//  Copyright © 2017年 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewUnitsViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // MARK: - Tests for Text

    func testText_Imperial() {
        let viewModel = SettingsViewUnitsViewModel(unitsNotation: .imperial)

        XCTAssertEqual(viewModel.text, "Imperial")
    }

    func testText_Metric() {
        let viewModel = SettingsViewUnitsViewModel(unitsNotation: .metric)

        XCTAssertEqual(viewModel.text, "Metric")
    }

    // MARK: - Tests for Accessory Type

    func testAccessoryType_Imperial_Imperial() {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        let viewModel = SettingsViewUnitsViewModel(unitsNotation: .imperial)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }


    func testAccessoryType_Imperial_Metric() {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        let viewModel = SettingsViewUnitsViewModel(unitsNotation: .metric)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }

    func testAccessoryType_Metric_Imperial() {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        let viewModel = SettingsViewUnitsViewModel(unitsNotation: .imperial)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }


    func testAccessoryType_Metric_Metric() {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        let viewModel = SettingsViewUnitsViewModel(unitsNotation: .metric)

        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }
    
}
