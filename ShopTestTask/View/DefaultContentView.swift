//
//  DefaultContentView.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 10.12.22.
//

import SwiftUI

struct DefaultContentView: View {

    @Binding private var isPresented: Bool

    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.assetOrange)
                    .frame(height: 100)
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            Text("Oops!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Text("something went wrong..")
                .font(.title)
        }
        .onTapGesture { isPresented.toggle() }
    }
}

