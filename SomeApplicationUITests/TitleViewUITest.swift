//
//  TitleViewUITest.swift
//  SomeApplicationUITests
//
//  Created by Akylbek Utekeshev on 5/21/21.
//

import XCTest

class TitleViewUITest: XCTestCase {
	
	private lazy var app = XCUIApplication()
	private lazy var titleLabel = app.staticTexts["TitleViewLabel"]
	private lazy var titleViewBackgroundImage = app.images["TitleViewBackgroundImage"]
	
	func testTitleView() {
		Robot(app: app)
			.start()
			.checkTitle(element: titleLabel, contains: "Certificates")
			.checkImage(image: titleViewBackgroundImage, predicates: [.exists])
			.checkImage(image: titleViewBackgroundImage, predicates: [.contains("Background1")])
	}
}
