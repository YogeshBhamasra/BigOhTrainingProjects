//
//  Strings.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 23/02/23.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
