//
//  ShopTestTaskApp.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import SwiftUI

@main
struct ShopTestTaskApp: App {

    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel())
        }
    }

}
