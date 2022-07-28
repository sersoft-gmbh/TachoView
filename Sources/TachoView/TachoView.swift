import SwiftUI

@available(iOS 14, macOS 12.0, *)
public struct TachoView: View {
    func tick(at angle: Angle, size: CGFloat) -> some View {
        let calcWidth = 0.025 * size
        let calcHeight = 0.12 * size
        return VStack {
            Rectangle()
                .fill(tickColor)
                .frame(width: calcWidth, height: calcHeight)
                .cornerRadius(calcWidth / 2)
            Spacer()
        }.rotationEffect(angle)
            .padding(calcHeight * 0.85)
    }
    
    func needle(at angle: Angle, size: CGFloat) -> some View {
        let calcWidth = 0.06 * size
        let calcHeight = 0.46 * size
        return VStack {
            TachoNeedle()
                .fill(needleColor)
                .frame(width: calcWidth, height: calcHeight)
                .cornerRadius(calcWidth / 2)
            Spacer()
        }.rotationEffect(angle)
            .padding(calcHeight * 0.3)
    }
    
    private var tickAngles: Array<Angle> {
        let startAngle = coveredRadius / 2 * -1
        let stepper = coveredRadius / Double(tickCount + 1)
        var angles = [Angle(degrees: startAngle)]
        angles.append(contentsOf: (0..<tickCount+1).map { tick in
            return Angle.degrees(startAngle + stepper * Double(tick + 1))
        })
        return angles
    }
    
    let coveredRadius: Double = 255
    let tickCount: Int
    let tachoColor: Color
    let tickColor: Color
    let needleColor: Color
    
    let value: Int
    
    private var keyFrames: Array<KeyFrame> {
        [
            KeyFrame(offset: 0.3, value: 0, animationKind: .linear),
            KeyFrame(offset: 0.6, value: tickCount + 1, animationKind: .easeInOut),
            KeyFrame(offset: 0.9, value: value, animationKind: .easeOut),
        ]
    }
    
    // current keyframe number
    @State var idx: Int = 0
    
    public var body: some View {
        TimelineView(.keyframe(timeOffsets: keyFrames.map {$0.offset})) { timeline in
            GeometryReader { geometry in
                let calcSize = min(geometry.size.width, geometry.size.height)
                let ticks = tickAngles.dropFirst().dropLast()
                ZStack {
                    TachoShape()
                        .foregroundColor(tachoColor)
                    ForEach(ticks, id: \.self) { angle in
                        tick(at: angle, size: calcSize )
                    }
                    let keyFrame = keyFrames[idx]
                    needle(at: tickAngles[keyFrame.value], size: calcSize)
                        .animation(keyFrame.animation, value: keyFrame.value)
                }
                .frame(width: calcSize, height: calcSize)
            }
            .onChange(of: timeline.date) { (date: Date) in advanceKeyFrame() }
            .onAppear { advanceKeyFrame() }
        }
    }
    
    func advanceKeyFrame() {
        // advance to next keyframe
        idx = (idx + 1) % keyFrames.count
    }
    
    public init(tickCount: Int,
                tachoColor: Color,
                tickColor: Color,
                needleColor: Color,
                value: Int) {
        self.tickCount = tickCount
        self.tachoColor = tachoColor
        self.tickColor = tickColor
        self.needleColor = needleColor
        self.value = value
    }
}

fileprivate enum KeyFrameAnimation {
    case none
    case linear
    case easeOut
    case easeIn
    case easeInOut
}

@available(iOS 14, macOS 12.0, *)
fileprivate struct KeyFrame {
    let offset: TimeInterval
    let value: Int
    let animationKind: KeyFrameAnimation
    
    var animation: Animation? {
        switch animationKind {
        case .none: return nil
        case .linear: return .linear(duration: offset)
        case .easeIn: return .easeIn(duration: offset)
        case .easeOut: return .easeOut(duration: offset)
        case .easeInOut: return .easeInOut(duration: offset)
        }
    }
}

@available(iOS 14, macOS 12.0, *)
struct TachoView_Previews: PreviewProvider {
    static var previews: some View {
        TachoView(tickCount: 7,
                  tachoColor: Color.red,
                  tickColor: Color.blue,
                  needleColor: Color.yellow,
                  value: 3)
        .frame(width: 300, height: 300, alignment: .center)
    }
}

@available(iOS 14, macOS 12.0, *)
struct KeyframeTimelineSchedule: TimelineSchedule {
    let timeOffsets: Array<TimeInterval>

    func entries(from startDate: Date, mode: TimelineScheduleMode) -> Entries {
        Entries(start: startDate, offsets: timeOffsets)
    }

    struct Entries: Sequence, IteratorProtocol {
        let offsets: Array<TimeInterval>
        var last: Date
        var idx: Int

        init(start: Date, offsets: Array<TimeInterval>) {
            self.last = start
            self.offsets = offsets
            self.idx = offsets.startIndex
        }

        mutating func next() -> Date? {
            guard idx < offsets.endIndex else { return nil }
            last = last.addingTimeInterval(offsets[idx])
            offsets.formIndex(after: &idx)
            return last
        }
    }
}

@available(iOS 14, macOS 12.0, *)
extension TimelineSchedule where Self == KeyframeTimelineSchedule {
    static func keyframe(timeOffsets: Array<TimeInterval>) -> KeyframeTimelineSchedule {
            .init(timeOffsets: timeOffsets)
    }
}











