//
//  CardView.swift
//  SomeApplication
//
//  Created by Akylbek Utekeshev on 5/18/21.
//

import SwiftUI

struct CardView: View {
	var body: some View {
		VStack {
			HStack {
				VStack(alignment: .leading) {
					Text("UI Design")
						.font(.title)
						.fontWeight(.semibold)
						.foregroundColor(.white)
						.accessibility(identifier: "CardViewTitle")
					Text("Certificates")
						.accessibility(identifier: "CardViewSubtitle")
						.foregroundColor(Color("accent"))
				}
				Spacer()
				Image("Logo1")
					.accessibility(identifier: "CardViewLogoImage")
			}
			.padding([.horizontal, .top], 20)
			Spacer()
			Image("Card1")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 300, height: 110, alignment: .top)
				.accessibility(identifier: "CardViewCardImage")
		}

	}
}
