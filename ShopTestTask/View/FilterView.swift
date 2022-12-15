//
//  FilterView.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import SwiftUI

enum FilterOption: String, CaseIterable {
    case brand
    case price
    case size

    var description: String {
        switch self {
        case .brand:
            return "Samsung"
        case .price:
            return "$300 - $500"
        case .size:
            return "4.5 to 5.5 inches"
        }
    }
}

extension FilterOption: Identifiable {
    var id: String {
        self.rawValue
    }
}

struct FilterView: View {

    @Binding private var isShowed: Bool
    @Binding private var selectedBrand: String
    private let brands: [String]

    init(isShowed: Binding<Bool>,
         selectedBrand: Binding<String>,
         brands: [String]
    ) {
        self._isShowed = isShowed
        self._selectedBrand = selectedBrand
        self.brands = brands
    }

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                RoundedSquareButton(.systemImage("xmark"), color: .darkBlue) {
                    isShowed.toggle()
                }
                Spacer()
                RoundedSquareButton(.title("Done"), color: .orange)
            }
            .overlay {
                Text("Filter options")
                    .font(Font.system(size: 18, weight: .light))
            }
            .padding()
            filterOptions
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.2), radius: 10)
        )
    }

    private var filterOptions: some View {
        VStack {
            ForEach(FilterOption.allCases) { option in
                VStack(alignment: .leading) {
                    Text(option.rawValue.capitalized)
                        .font(Font.system(size: 16, weight: .regular))
                    HStack {
                        Text(option.description)
                            .font(Font.system(size: 18, weight: .light))
                        Spacer()
                        Button {

                        } label: {
                            Image(Constants.Image.arrowDown)
                        }
                    }
                    .padding(.vertical, 7)
                    .padding(.horizontal, 14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black.opacity(0.2), lineWidth: 1)
                           )
                }
                .padding(.horizontal)
            }
        }
        .padding(.top, 20)
        .padding(.bottom, 60)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(isShowed: .constant(false),
                   selectedBrand: .constant("Samsung"),
                   brands: ["one", "two", "three"])
    }

}
