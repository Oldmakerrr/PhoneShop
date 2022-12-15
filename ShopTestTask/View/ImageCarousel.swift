//
//  ImageCarousel.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 10.12.22.
//

import SwiftUI

struct ImageCarousel: View {

    private let images: [String]
    @State private var selectedIndex: Int = 0

    init(images: [String]) {
        self.images = images
    }

    var body: some View {
        CarouselView(
            pageCount: images.count,
            currentIndex: $selectedIndex
        ) {
            ForEach(Array(images.enumerated()), id: \.offset) { index, image in
                    AsyncImage(url: .init(string: image)) { image in
                        image
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: index == selectedIndex ? 280: 220)
                            .shadow(color: .black.opacity(0.1), radius: 10)
                    } placeholder: {
                        ProgressView()
                    }
            }
        }
    }
}

struct ImageCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarousel(
            images: ["https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig",
                     "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg",
                     "https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig",
                     "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg"])
    }
}

struct CarouselView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    @ViewBuilder let content: Content

    @GestureState private var translation: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            LazyHStack(spacing: 0) {
                self.content.frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * (geometry.size.width))
            .offset(x: self.translation)
            .animation(.interactiveSpring(), value: currentIndex)
            .animation(.interactiveSpring(), value: translation)
            .gesture(
                DragGesture()
                    .updating(self.$translation) { value, state, _ in
                        state = value.translation.width
                    }.onEnded { value in
                        let offset = value.translation.width / geometry.size.width
                        let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                        self.currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                    }
            )
        }
    }
}
