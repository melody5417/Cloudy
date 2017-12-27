//
//  XCTestCase.swift
//  CloudyTests
//
//  Created by yiqiwang(王一棋) on 2017/12/27.
//  Copyright © 2017年 Cocoacasts. All rights reserved.
//

import XCTest

extension XCTestCase {

    func loadDataFromBundle(withName name: String, extension: String) -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)

        return try! Data(contentsOf: url!)
    }

}
