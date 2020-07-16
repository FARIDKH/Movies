//
//  CustomBezier.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 07. 14..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI

struct CustomBezier: Shape {
    let bezierPath: UIBezierPath

    func path(in rect: CGRect) -> Path {
        let path = Path(bezierPath.cgPath)

        // Figure out how much bigger we need to make our path in order for it to fill the available space without clipping.
        let multiplier = min(rect.width, rect.height)

        // Create an affine transform that uses the multiplier for both dimensions equally.
        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)

        // Apply that scale and send back the result.
        return path.applying(transform)
    }
}
