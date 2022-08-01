//#if swift(>=5.7)
//import Foundation
//#else
//@preconcurrency import Foundation
//#endif
//import SwiftUI
//
//struct KeyFrame<Value> {
//    enum AnimationKind: Hashable, Sendable {
//        case linear, easeOut, easeIn, easeInOut, spring
//    }
//
//    let offset: TimeInterval
//    let value: Value
//    let animationKind: AnimationKind?
//
//    var animation: Animation? {
//        switch animationKind {
//        case .none: return .none
//        case .linear: return .linear(duration: offset)
//        case .easeIn: return .easeIn(duration: offset)
//        case .easeOut: return .easeOut(duration: offset)
//        case .easeInOut: return .easeInOut(duration: offset)
//        case .spring: return .spring(blendDuration: offset)
//        }
//    }
//}
//
//extension KeyFrame: Equatable where Value: Equatable {}
//extension KeyFrame: Hashable where Value: Hashable {}
//extension KeyFrame: Sendable where Value: Sendable {}
//
//struct KeyFrameTimelineSchedule<Value>: TimelineSchedule {
//    struct Entries: Sequence {
//        struct Iterator: IteratorProtocol {
//            typealias Element = Date
//
//            var keyFrames: Array<KeyFrame<Value>>.Iterator
//            var last: Date?
//
//            mutating func next() -> Date? {
//                guard let keyFrame = keyFrames.next() else {
//                    let current = last
//                    last = nil
//                    return current
//                }
//                let current = last
//                last?.addTimeInterval(keyFrame.offset)
//                return current
//            }
//        }
//
//        let start: Date
//        let keyFrames: Array<KeyFrame<Value>>
//
//        init(start: Date, keyFrames: Array<KeyFrame<Value>>) {
//            self.start = start
//            self.keyFrames = keyFrames
//        }
//
//        func makeIterator() -> Iterator {
//            .init(keyFrames: keyFrames.makeIterator(), last: start)
//        }
//    }
//
//    let keyFrames: Array<KeyFrame<Value>>
//
//    func entries(from startDate: Date,
//                 mode: TimelineScheduleMode) -> Entries {
//        .init(start: startDate, keyFrames: keyFrames)
//    }
//}
//
//extension KeyFrameTimelineSchedule: Equatable where Value: Equatable {}
//extension KeyFrameTimelineSchedule: Hashable where Value: Hashable {}
//extension KeyFrameTimelineSchedule: Sendable where Value: Sendable {}
//extension KeyFrameTimelineSchedule.Entries: Equatable where Value: Equatable {}
//extension KeyFrameTimelineSchedule.Entries: Hashable where Value: Hashable {}
//extension KeyFrameTimelineSchedule.Entries: Sendable where Value: Sendable {}
//extension KeyFrameTimelineSchedule.Entries.Iterator: Sendable where Value: Sendable {}
//
//extension TimelineSchedule {
//    static func keyFrames<Value>(_ keyFrames: Array<KeyFrame<Value>>) -> KeyFrameTimelineSchedule<Value>
//    where Self == KeyFrameTimelineSchedule<Value>
//    {
//        .init(keyFrames: keyFrames)
//    }
//}
