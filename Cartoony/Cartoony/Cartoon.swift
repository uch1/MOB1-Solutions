//
//  Cartoon.swift
//  Cartoony
//
//  Created by Uchenna  Aguocha on 10/22/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import Foundation
import UIKit

//class Cartoon {
//    var name: String
//    var shadowImage: UIImage
//    var actualImage: UIImage
//
//    init(name: String, shadowImage: UIImage, actualImage: UIImage) {
//        self.name = name
//        self.shadowImage = shadowImage
//        self.actualImage = actualImage
//    }
//
//}

struct Cartoon {
    var name: String
    var shadowImage: UIImage
    var actualImage: UIImage
}

extension Cartoon: Equatable {
    static func ==(lhs: Cartoon, rhs: Cartoon) -> Bool {
        return lhs.name == rhs.name
    }
}
