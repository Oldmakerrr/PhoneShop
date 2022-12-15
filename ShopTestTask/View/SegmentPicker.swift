//
//  SegmentPicker.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 11.12.22.
//

import SwiftUI

enum DetailOption: String, CaseIterable {
    case shop
    case detail
    case features
}

struct SegmentPicker: View {

    @Binding private var selectedOption: DetailOption

    private var width: CGFloat {
        let numberOfSection: CGFloat = CGFloat(DetailOption.allCases.count)
        let emptySpace: CGFloat = numberOfSection + 1 * spacing
        return UIScreen.main.bounds.width / numberOfSection - emptySpace
    }

    private let spacing: CGFloat

    private var offset: CGSize {
        let height: CGFloat = 0
        let width: CGFloat
        switch selectedOption {
        case .shop:
            width = -(self.width + spacing)
        case .detail:
            width = 0
        case .features:
            width = self.width + spacing
        }
        return CGSize(width: width, height: height)
    }

    init(selectedOption: Binding<DetailOption>,
         spacing: CGFloat = 40
    ) {
        self._selectedOption = selectedOption
        self.spacing = spacing
    }

    var body: some View {
        VStack(spacing: 6) {
            HStack(spacing: spacing) {
                ForEach(DetailOption.allCases, id: \.self) { option in
                        Text(option.rawValue.capitalized)
                            .font(font(option))
                            .foregroundColor(foregroundColor(option))
                            .frame(width: width)
                            .onTapGesture { selectedOption = option }
                }
            }
            .padding(.horizontal)
                RoundedRectangle(cornerRadius: 2, style: .continuous)
                    .fill(Color.assetOrange)
                    .frame(width: width, height: 4)
                    .offset(offset)
                    .animation(.easeInOut(duration: 0.2), value: offset)
        }
    }

    private func font(_ option: DetailOption) -> Font {
        let fontWeight: String = option == selectedOption ? "Bold" : "Light"
        return Font.custom("MarkPro-" + fontWeight, size: 20)
    }

    private func foregroundColor(_ option: DetailOption) -> Color {
        option == selectedOption ? .assetDarkBlue : .gray
    }

}

struct SegmentPicker_Previews: PreviewProvider {
    static var previews: some View {
        SegmentPicker(selectedOption: .constant(.shop))
    }
}
