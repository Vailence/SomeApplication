//
//  BottomCardViewUITest.swift
//  SomeApplicationUITests
//
//  Created by Akylbek Utekeshev on 5/24/21.
//

import XCTest

class BottomCardViewUITest: XCTestCase {
	
	private lazy var app = XCUIApplication()
	private lazy var titleLabel = app.staticTexts["BottomCardDescription"]
	private lazy var titleViewBackgroundImage = app.images["TitleViewBackgroundImage"]
	
	func testBottomCardView() {
		print(titleLabel)
		Robot(app: app)
			.start()
			.checkTitle(element: titleLabel, contains: "Akylbek")
			.checkImage(image: titleViewBackgroundImage, predicates: [.exists])
			.checkImage(image: titleViewBackgroundImage, predicates: [.contains("Background1")])
	}
}
