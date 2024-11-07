//
//  UIApplication.swift
//  Movie
//
//  Created by Ahmed Ali on 19/04/2023.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

