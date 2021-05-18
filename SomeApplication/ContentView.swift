//
//  ContentView.swift
//  SomeApplication
//
//  Created by Akylbek Utekeshev on 5/18/21.
//

import SwiftUI

struct ContentView: View {
	@State private var show = false
	@State private var viewState = CGSize.zero
	@State private var showCard = false
	@State private var bottomState = CGSize.zero
	@State private var showFull = false
	
    var body: some View {
		ZStack {
			TitleView()
				.blur(radius: show ? 20 : 0)
				.opacity(showCard ? 0.4 : 1)
				.offset(y: showCard ? -200 : 0)
				.animation(
					Animation
						.default
						.delay(0.1)
//						.speed(2)
//						.repeatCount(2, autoreverses: false)
				)
			
			BackCardView()
				.frame(width: 340, height: 220, alignment: .center)
				.background(show ? Color.green : Color.pink)
				.cornerRadius(20)
				.shadow(radius: 20)
				.offset(x: 0, y: show ? -400 : -40)
				.offset(x: viewState.width, y: viewState.height)
				.offset(y: showCard ? -180 : 0)
				.scaleEffect(0.9)
				.rotationEffect(.degrees(show ? 0 : 10))
				.rotation3DEffect(
					Angle(degrees: 10),
					axis: (x: 10, y: 0, z: 0))
				.blendMode(.hardLight)
				.animation(.easeInOut(duration: 0.5))
			
			BackCardView()
				.frame(width: 340, height: 220, alignment: .center)
				.background(show ? Color.pink : Color.green)
				.cornerRadius(20)
				.shadow(radius: 20)
				.offset(x: 0, y: show ? -200 : -20)
				.offset(x: viewState.width, y: viewState.height)
				.offset(y: showCard ? -140 : 0)
				.scaleEffect(0.95)
				.rotationEffect(.degrees(show ? 0 : 5))
				.rotation3DEffect(
					Angle(degrees: 5),
					axis: (x: 10, y: 0, z: 0))
				.blendMode(.hardLight)
				.animation(.easeInOut(duration: 0.3))
			
			CardView()
				.frame(width: showCard ? 375 : 340.0, height: 220.0)
				.background(Color.black)
				.clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20,
											style: .continuous))
				.shadow(radius: 20)
				.offset(x: viewState.width, y: viewState.height)
				.offset(y: showCard ? -100 : 0)
				.blendMode(.hardLight)
				.animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
				.onTapGesture {
					showCard.toggle()
				}
				.gesture(
					DragGesture()
						.onChanged { value in
							viewState = value.translation
							show = true
						}
						.onEnded { _ in
							viewState = .zero
							show = false
						}
				)
			
			BottomCardView()
				.offset(x: 0, y: showCard ? 360 : 1000)
				.offset(y: bottomState.height)
				.blur(radius: show ? 20 : 0)
				.animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
			.gesture(
				DragGesture().onChanged { value in
					bottomState = value.translation
					if showFull {
						bottomState.height += -300
					}
					
					if bottomState.height < -300 {
						bottomState.height = -300
					}
				}
				.onEnded { _ in
					if bottomState.height > 50 {
						showCard = false
					}
					
					if (bottomState.height < -100 && !showFull)
						|| (bottomState.height < -250 && self.showFull) {
						bottomState.height = -300
						showFull = true
					} else {
						bottomState = .zero
						showFull = false
					}

				}
			)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
