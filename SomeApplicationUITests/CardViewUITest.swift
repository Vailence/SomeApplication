//
//  CardViewUITest.swift
//  SomeApplicationUITests
//
//  Created by Akylbek Utekeshev on 5/24/21.
//

import XCTest

class CardViewUITest: XCTestCase {

	private lazy var app = XCUIApplication()
	private lazy var titleLabel = app.staticTexts["CardViewTitle"]
	private lazy var subtitleLabel = app.staticTexts["CardViewSubtitle"]
	private lazy var cardViewLogoImage = app.images["CardViewLogoImage"]
	private lazy var cardViewCardImage = app.images["CardViewCardImage"]
	
	func testCardView() {
		Robot(app: app)
			.start()
			.checkTitle(element: titleLabel, contains: "UI Design")
			.checkTitle(element: subtitleLabel, contains: "Certificates")
			.checkImage(image: cardViewLogoImage, predicates: [.exists])
			.checkImage(image: cardViewLogoImage, predicates: [.contains("Logo1")])
		
			.checkImage(image: cardViewCardImage, predicates: [.exists])
			.checkImage(image: cardViewCardImage, predicates: [.contains("Card1")])
	}
}
