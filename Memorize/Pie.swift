//
//  Pie.swift
//  Memorize
//
//  Created by 🤨 on 29/06/21.
//

import SwiftUI

struct Pie: Shape {
    var starAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start =
            CGPoint(
                x: center.x + radius * CGFloat(cos(starAngle.radians)),
                y: center.y + radius * CGFloat(sin(starAngle.radians))
            )
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: starAngle,
            endAngle: endAngle,
            clockwise: !clockwise
        )
        p.addLine(to: center)
        return p
    }
    
}
