//
//  TitleView.swift
//  SomeApplication
//
//  Created by Akylbek Utekeshev on 5/21/21.
//

import SwiftUI

struct TitleView: View {
	var body: some View {
		VStack {
			HStack {
				Text("Certificates")
					.font(.largeTitle)
					.fontWeight(.bold)
					.accessibility(identifier: "TitleViewLabel")
				
				Spacer()
			}
			.padding()
			Image("Background1")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.accessibility(identifier: "TitleViewBackgroundImage")
			
			Spacer()
		}
	}
}
