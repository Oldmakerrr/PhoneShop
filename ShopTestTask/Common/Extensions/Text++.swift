//
//  Text++.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 12.12.22.
//

import SwiftUI

extension Text {

    func fontMarkPro400(_ size: CGFloat) -> Text {
        self.font(Font.custom(Constants.FontName.markProLight, size: size))
    }

    func fontMarkPro500(_ size: CGFloat) -> Text {
        self.font(Font.custom(Constants.FontName.markProMedium, size: size))
    }

    func fontMarkPro700(_ size: CGFloat) -> Text {
        self.font(Font.custom(Constants.FontName.markProBold, size: size))
    }

    func fontMarkPro800(_ size: CGFloat) -> Text {
        self.font(Font.custom(Constants.FontName.markProHeavy, size: size))
    }
    
}
