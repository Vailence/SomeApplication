//
//  BottomCardView.swift
//  SomeApplication
//
//  Created by Akylbek Utekeshev on 5/21/21.
//

import SwiftUI

struct BottomCardView: View {
	var body: some View {
		VStack(spacing: 16) {
			Rectangle()
				.background(Color.white)
				.frame(width: 40, height: 5, alignment: .center)
				.cornerRadius(3.0)
				.opacity(0.1)
			Text("This certificate is proof that Akylbek Utekeshev has achieved the UI Design course with approval from a Design+Code instructor.")
				.multilineTextAlignment(.center)
				.font(.subheadline)
				.accessibility(identifier: "BottomCardDescription")
			Spacer()
		}
		.padding(.top, 8)
		.padding(.horizontal, 20)
		.frame(maxWidth: .infinity)
		.background(Color.white)
		.cornerRadius(30)
		.shadow(radius: 20)
		.accessibility(identifier: "BottomCardVStack")
	}
}
