//
//  ProductDetailBottomSheet.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 10.12.22.
//

import SwiftUI

struct ProductDetailBottomSheet: View {

    @Binding private var selectedOption: DetailOption
    @Binding private var selectedColor: String
    @Binding private var selectedCapacity: String
    @State private var isLiked = false
    private var phoneDetail: PhoneDetail
    private let addToCardDidTap: (() -> Void)?

    init(selectedOption: Binding<DetailOption>,
         phoneDetail: PhoneDetail,
         selectedCapacity: Binding<String>,
         selectedColor: Binding<String>,
         addToCardDidTap: (() -> Void)? = nil
    ) {
        self._selectedOption = selectedOption
        self._selectedCapacity = selectedCapacity
        self.phoneDetail = phoneDetail
        self.addToCardDidTap = addToCardDidTap
        self._selectedColor = selectedColor
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(phoneDetail.title)
                        .fontMarkPro500(24)
                        .foregroundColor(.assetDarkBlue)
                    ratingView
                }
                Spacer()
                RoundedSquareButton(.assetImage(Constants.Image.heart),
                                    color: isLiked ? .orange : .darkBlue) {
                    isLiked.toggle()
                }
            }
            .padding()
            SegmentPicker(selectedOption: $selectedOption)
            HStack(spacing: 20) {
                specView(imageName: Constants.Image.cpu, title: phoneDetail.cpu)
                specView(imageName: Constants.Image.camera, title: phoneDetail.camera)
                specView(imageName: Constants.Image.sd, title: phoneDetail.ssd)
                specView(imageName: Constants.Image.ssd, title: phoneDetail.sd)
            }
            .padding(.top)
            selectOptionView
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
        )
    }

    private var selectOptionView: some View {
        VStack {
            HStack {
                Text("Select color and capacity")
                    .fontMarkPro500(16)
                    .foregroundColor(.assetDarkBlue)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            HStack {
                HStack(spacing: 18) {
                    ForEach(phoneDetail.colorsString, id: \.self) { color in
                        ZStack {
                            Circle()
                                .fill(Color(hexaString: color))
                                .frame(width: 40, height: 40)
                            Image(Constants.Image.checkMark)
                                .opacity(color == selectedColor ? 1 : 0)
                        }
                        .onTapGesture {
                            selectedColor = color
                        }
                    }
                    Spacer()
                }
                HStack(spacing: 20) {
                    ForEach(phoneDetail.capacity, id: \.self) { capacity in
                        sdView(title: title(capacity),
                               backgroundColor: backgroundColor(capacity),
                               foregroundColor: foregroundColor(capacity))
                        .onTapGesture {
                            selectedCapacity = capacity
                        }
                    }
                }
            }
            .padding(.horizontal, 15)
            AddToCardButton(title: "Add to Card",
                            price: phoneDetail.price)
            .padding(.bottom, 10)
        }
    }

    private func sdView(title: String,
                backgroundColor: Color,
                foregroundColor: Color) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(backgroundColor)
                .frame(width: 71, height: 30)
            Text(title)
                .fontMarkPro700(13)
                .foregroundColor(foregroundColor)
                .frame(width: 71, height: 30)
        }
    }

    private var ratingView: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(Constants.Image.star)
                    .withColor(index < Int(phoneDetail.rating) ? .yellow : .gray)
            }
        }
    }

    private func specView(imageName: String, title: String) -> some View {
        VStack {
            ZStack {
                Image(imageName)
                    .frame(width: 35, height: 35)
            }
            Text(title)
                .fontMarkPro400(11)
                .foregroundColor(.black.opacity(0.6))
        }
        .frame(width: 70)
    }

    private func title(_ capacity: String) -> String {
        "\(capacity) \(capacity == selectedCapacity ? "GB" : "gb")"
    }

    private func backgroundColor(_ capacity: String) -> Color {
        capacity == selectedCapacity ? .assetOrange : .clear
    }

    private func foregroundColor(_ capacity: String) -> Color {
        capacity == selectedCapacity ? .white : .black.opacity(0.6)
    }
}

struct ProductDetailBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailBottomSheet(selectedOption: .constant(.shop), phoneDetail: .mock, selectedCapacity: .constant(""), selectedColor: .constant(""))
    }
}
