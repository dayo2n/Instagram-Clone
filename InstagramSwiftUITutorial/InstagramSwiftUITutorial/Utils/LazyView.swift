//
//  LazyView.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/07/07.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
