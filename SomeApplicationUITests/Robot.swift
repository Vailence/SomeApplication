//
//  Robot.swift
//  SomeApplicationUITests
//
//  Created by Akylbek Utekeshev on 5/21/21.
//

import Foundation
import XCTest

class Robot {
	private static let defaultTimeout: Double = 30
	
	var app: XCUIApplication
	
	init(app: XCUIApplication) {
		self.app = app
	}
	
	@discardableResult
	func start(timeout: TimeInterval = Robot.defaultTimeout) -> Self {
		app.launch()
		assert(app, [.exists], timeout: timeout)
		
		return self
	}
	
	@discardableResult
	func assert(_ element: XCUIElement, _ predicates: [Predicate], timeout: TimeInterval = Robot.defaultTimeout) -> Self {
		let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: predicates.map { $0.format }.joined(separator: " AND ")), object: element)
		guard XCTWaiter.wait(for: [expectation], timeout: timeout) == .completed else {
			XCTFail("[\(self)] Element \(element.description) did not fulfill expectation: \(predicates.map { $0.format })")
			return self
		}
		
		return self
	}
	
	@discardableResult
	func checkTitle(element: XCUIElement, contains title: String) -> Self {
		assert(element, [.isHittable, .contains(title)])
		return self
	}
	
	@discardableResult
	func checkImage(image: XCUIElement, predicates: [Predicate]) -> Self {
		assert(image, predicates)

		return self
	}
}

enum Predicate {
	case contains(String), doesNotContain(String)
	case exists, doesNotExist
	case isHittable, isNotHittable
	
	var format: String {
		switch self {
		case .contains(let label):
			return "label == '\(label)'"
		case .doesNotContain(let label):
			return "label != '\(label)'"
		case .exists:
			return "exists == true"
		case .doesNotExist:
			return "exists == false"
		case .isHittable:
			return "isHittable == true"
		case .isNotHittable:
			return "isHittable == false"
		}
	}
}
