//
//  MenuView.swift
//  SomeApplication
//
//  Created by Akylbek Utekeshev on 5/24/21.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
		VStack {
			Spacer()
			VStack(spacing: 16) {
				Text("Akylbek - 28% complete")
					.font(.caption)
				
				Color.white
					.frame(width: 38, height: 6)
					.cornerRadius(3)
					.frame(width: 130, height: 6, alignment: .leading)
					.background(Color.black.opacity(0.08))
					.cornerRadius(3)
					.padding()
					.frame(width: 150, height: 24)
					.background(Color.black.opacity(0.1))
					.cornerRadius(12)
				
				MenuRow(title: "Account", imageName: "gear")
				MenuRow(title: "Billing", imageName: "creditcard")
				MenuRow(title: "Sign out", imageName: "person.crop.circle")
			}
			.frame(maxWidth: .infinity)
			.frame(height: 300)
			.background(
				LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))]),
							   startPoint: .top,
							   endPoint: .bottom)
			)
			.clipShape(
				RoundedRectangle(cornerRadius: 30, style: .continuous)
			)
			.shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
			.padding(.horizontal, 30)
			.overlay(
				Image("Avatar")
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 60, height: 60)
					.clipShape(Circle())
					.offset(y: -150)
			)
		}
		.padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
	var title: String
	var imageName: String
	
	var body: some View {
		HStack(spacing: 16) {
			Image(systemName: imageName)
				.font(.system(size: 20, weight: .bold))
				.imageScale(.large)
				.frame(width: 32, height: 32, alignment: .center)
				.foregroundColor(.black)
			
			Text(title)
				.font(.system(size: 20, weight: .bold, design: .default))
				.frame(width: 120, alignment: .leading)
		}
	}
}
