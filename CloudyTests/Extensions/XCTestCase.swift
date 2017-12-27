//
//  XCTestCase.swift
//  CloudyTests
//
//  Created by yiqiwang(王一棋) on 2017/12/27.
//  Copyright © 2017年 Cocoacasts. All rights reserved.
//

import XCTest

extension XCTestCase {

    func loadDataFromBundle() -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: "forecast", withExtension: "json")

        return try! Data(contentsOf: url!)
    }

}
