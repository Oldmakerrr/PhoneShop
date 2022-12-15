//
//  HeaderView.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import SwiftUI

struct HeaderView: View {
    
    private let title: String
    private let buttonTitle: String
    private let didTap: (() -> Void)?

    init(title: String,
         buttonTitle: String,
         didTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.buttonTitle = buttonTitle
        self.didTap = didTap
    }

    var body: some View {
        HStack {
            Text(title)
                .fontMarkPro700(25)
                .foregroundColor(.assetDarkBlue)
            Spacer()
            Button(action: didTap ?? {}) {
                Text(buttonTitle)
                    .fontMarkPro400(15)
                    .foregroundColor(.assetOrange)
            }
        }
        .padding(.horizontal)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", buttonTitle: "button")
    }
}
