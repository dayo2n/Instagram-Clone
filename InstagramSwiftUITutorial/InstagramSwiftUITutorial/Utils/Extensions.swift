//
//  Extensions.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/09.
//

import UIKit

extension UIApplication {
    func endEditing() {  // disappear the keyboard
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
