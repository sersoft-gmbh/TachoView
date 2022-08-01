import SwiftUI

struct TachoNeedle: Shape {
    func path(in rect: CGRect) -> Path {
        let tipSizeYOffset = rect.width / 10
        let tipSizeXOffset = tipSizeYOffset / 1.25
        return Path {
            $0.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            $0.addLine(to: CGPoint(x: rect.midX - tipSizeXOffset,
                                   y: rect.minY + tipSizeYOffset))
            $0.addQuadCurve(to: CGPoint(x: rect.midX + tipSizeXOffset,
                                        y: rect.minY + tipSizeYOffset),
                            control: .init(x: rect.midX, y: rect.minY))
            // where tipSize = width / 8
            // However, this somehow leaves a gap between the circle
            // and the rest of the path.
//            $0.addArc(center: CGPoint(x: rect.midX, y: rect.minY + tipSize),
//                      radius: tipSize,
//                      startAngle: .degrees(0),
//                      endAngle: .degrees(-180),
//                      clockwise: true)
            $0.addLine(to: CGPoint(x: rect.midX + tipSizeXOffset,
                                   y: rect.minY + tipSizeYOffset))
            $0.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            $0.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

        }
    }
}

struct TachoNeedle_Previews: PreviewProvider {
    static var previews: some View {
        TachoNeedle()
            .fill(Color.red)
            .frame(width: 50, height: 300)
            .cornerRadius(50 / 2)
            .rotationEffect(.degrees(-25))
    }
}
