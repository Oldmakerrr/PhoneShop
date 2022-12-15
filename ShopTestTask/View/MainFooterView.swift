//
//  MainFooterView.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 09.12.22.
//

import SwiftUI

struct MainFooterView: View {

    private let height: CGFloat = 72
    private let exploreDidTap: (() -> Void)?
    private let cartDidTap: (() -> Void)?
    private let favoriteDidTap: (() -> Void)?
    private let profileDidTap: (() -> Void)?
    
    init(exploreDidTap: (() -> Void)? = nil,
         cartDidTap: (() -> Void)? = nil,
         favoriteDidTap: (() -> Void)? = nil,
         profileDidTap: (() -> Void)? = nil
    ) {
        self.exploreDidTap = exploreDidTap
        self.cartDidTap = cartDidTap
        self.favoriteDidTap = favoriteDidTap
        self.profileDidTap = profileDidTap
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(Color.assetDarkBlue)
                .frame(height: height)
            HStack(spacing: 50) {
                Button(action: exploreDidTap ?? {}) {
                    HStack {
                        Image(systemName: "circle.fill")
                            .withSize(width: 8, height: 8)
                            .foregroundColor(.white)
                        Text("Explorer")
                            .fontMarkPro700(15)
                        .foregroundColor(.white)
                    }
                }
                addIconButton(didTap: cartDidTap ?? {},
                              imageName: "laptop")
                addIconButton(didTap: favoriteDidTap ?? {},
                              imageName: "heart")
                addIconButton(didTap: profileDidTap ?? {},
                              imageName: "person")
            }
        }
        .padding(.horizontal, 2)
    }

    @ViewBuilder
    func addIconButton(didTap: @escaping () -> Void,
                       imageName: String) -> some View {
        Button(action: didTap) {
            Image(imageName)
                .withColor(.white)
        }
    }
}

struct MainFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MainFooterView()
    }
}
