import SwiftUI

public struct TachoView: View {
    func tick(of size: CGFloat) -> some View {
        let calcWidth = 0.025 * size
        let calcHeight = 0.12 * size
        return VStack {
            Rectangle()
                .fill(tickColor)
                .frame(width: calcWidth, height: calcHeight)
                .cornerRadius(calcWidth / 2)
            Spacer()
        }
        .padding(calcHeight * 0.85)
    }
    
    func needle(of size: CGFloat) -> some View {
        let calcWidth = 0.06 * size
        let calcHeight = 0.46 * size
        return VStack {
            TachoNeedle()
                .fill(needleColor)
                .frame(width: calcWidth, height: calcHeight)
                .cornerRadius(calcWidth / 2)
            Spacer()
        }
        .shadow(radius: 2)
        .padding(calcHeight * 0.3)
    }
    
    private var tickAngles: Array<Angle> {
        let coveredRadius: Double = 255
        let coveredRadiusHalf = coveredRadius / 2
        return stride(
            from: -coveredRadiusHalf,
            through: coveredRadiusHalf,
            by: coveredRadius / Double(tickCount + 1)
        ).map(Angle.degrees)
    }

    var tickCount: Int
    var tachoColor: Color
    var tickColor: Color
    var needleColor: Color
    
    var value: Int
    
//    private var keyFrames: Array<KeyFrame<Angle>> {
//        let angles = tickAngles
//        return [
//            KeyFrame(offset: 0.15, value: angles[0], animationKind: .easeOut),
//            KeyFrame(offset: 0.7, value: tickAngles[tickCount + 1], animationKind: .easeInOut),
//            KeyFrame(offset: 0.5, value: angles[value], animationKind: .spring),
//        ]
//    }

    @State
    private var currentValue = 0
    
    public var body: some View {
//        var frames = keyFrames
//        TimelineView(.keyFrames(keyFrames)) { context in
            GeometryReader { geometry in
                let calcSize = min(geometry.size.width, geometry.size.height)
                ZStack {
                    TachoOutline()
                        .foregroundColor(tachoColor)
                    ForEach(tickAngles.dropFirst().dropLast(), id: \.self) {
                        tick(of: calcSize)
                            .rotationEffect($0)
                    }
//                    let keyFrame = frames.removeFirst()
                    needle(of: calcSize)
                        .rotationEffect(tickAngles[currentValue])
//                        .animation(keyFrame.animation, value: keyFrame.value)
                        .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.5),
                                   value: currentValue)
                }
                .frame(width: calcSize, height: calcSize)
//            }
            .onChange(of: value) { currentValue = $0 }
            .onAppear { currentValue = value }
        }
    }
    
    public init(tickCount: Int,
                tachoColor: Color,
                tickColor: Color,
                needleColor: Color,
                value: Int) {
        assert(tickCount > 0)
        assert((0...tickCount).contains(value))
        self.tickCount = tickCount
        self.tachoColor = tachoColor
        self.tickColor = tickColor
        self.needleColor = needleColor
        self.value = value
    }
}

struct TachoView_Previews: PreviewProvider {
    struct InteractiveView: View {
        @State
        private var value = 3

        var body: some View {
            VStack {
                TachoView(tickCount: 7,
                          tachoColor: .red,
                          tickColor: .blue,
                          needleColor: .yellow,
                          value: value)
                Stepper("Value", value: $value, in: 1...7)
            }
        }
    }

    static var previews: some View {
        InteractiveView()
    }
}
