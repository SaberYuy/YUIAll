//
//  CGSize+ScaledSize.swift
//  YUIAll
//
//  Created by YUI on 21/03/2020.
//

import Foundation
import UIKit

extension CGSize {
    var scaledSize: CGSize {
        .init(width: width * UIScreen.main.scale, height: height * UIScreen.main.scale)
    }
}
