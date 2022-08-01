import SwiftUI

struct TachoOutline: Shape {
    private func path(inSquare rect: CGRect) -> Path {
        assert(rect.width == rect.height, "Square is not square!")

        let side = rect.width

        let lineThickness = side / 20
        let lineThicknessHalf = lineThickness / 2

        let circleSide = side - lineThickness

        let innerDotSize = lineThickness * 1.5
        let innerDotSizeHalf = innerDotSize / 2

        let lowerArcAngle: Double = 45

        var path = Path()
        path.addPath(.init(
            ellipseIn: .init(
                origin: .init(x: rect.minX + lineThicknessHalf,
                              y: rect.minY + lineThicknessHalf),
                size: .init(width: circleSide,
                            height: circleSide)
            )
        ).strokedPath(.init(lineWidth: lineThickness)))
        path.addPath(
            Path {
                $0.addArc(center: .init(x: rect.maxX - side / 2,
                                        y: rect.maxY + side / 7),
                          radius: side / 2.25,
                          startAngle: .degrees(180 + lowerArcAngle),
                          endAngle: .degrees(360 - lowerArcAngle),
                          clockwise: false)
            }.strokedPath(.init(lineWidth: lineThickness))
        )
        path.addEllipse(
            in: .init(origin: .init(x: rect.midX - innerDotSizeHalf,
                                    y: rect.midY - innerDotSizeHalf),
                      size: .init(width: innerDotSize,
                                  height: innerDotSize))
        )
        return path
    }

    func path(in rect: CGRect) -> Path {
        let side = min(rect.width, rect.height)
        let square = CGRect(
            origin: .init(x: rect.minX + (rect.width - side) / 2,
                          y: rect.minY + (rect.height - side) / 2),
            size: .init(width: side, height: side)
        )
        return path(inSquare: square)
    }
}

struct TachoOutline_Previews: PreviewProvider {
    static var previews: some View {
        TachoOutline()
            .fill(Color.red)
            .frame(width: 200, height: 200)
    }
}
