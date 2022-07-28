import SwiftUI

@available(iOS 14, macOS 12.0, *)
struct TachoNeedle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

@available(iOS 14, macOS 12.0, *)
struct TachoNeedle_Previews: PreviewProvider {
    static var previews: some View {
        TachoNeedle()
            .fill(Color.red)
            .frame(width: 6, height: 140)
    }
}
