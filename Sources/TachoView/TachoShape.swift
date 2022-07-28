import SwiftUI

// converter from tacho.svg / BPLog Assets (without ticks)
// using https://github.com/quassum/SVG-to-SwiftUI
@available(iOS 14, macOS 12.0, *)
struct TachoShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.80278*width, y: 0.79623*height))
        path.addCurve(to: CGPoint(x: 0.49963*width, y: 0.92609*height), control1: CGPoint(x: 0.72168*width, y: 0.87944*height), control2: CGPoint(x: 0.61403*width, y: 0.92408*height))
        path.addLine(to: CGPoint(x: 0.49211*width, y: 0.92609*height))
        path.addCurve(to: CGPoint(x: 0.07398*width, y: 0.50814*height), control1: CGPoint(x: 0.26172*width, y: 0.92609*height), control2: CGPoint(x: 0.07806*width, y: 0.74348*height))
        path.addCurve(to: CGPoint(x: 0.19722*width, y: 0.2058*height), control1: CGPoint(x: 0.07201*width, y: 0.39449*height), control2: CGPoint(x: 0.11578*width, y: 0.28696*height))
        path.addCurve(to: CGPoint(x: 0.50034*width, y: 0.07391*height), control1: CGPoint(x: 0.27834*width, y: 0.12261*height), control2: CGPoint(x: 0.38599*width, y: 0.07594*height))
        path.addLine(to: CGPoint(x: 0.50789*width, y: 0.07391*height))
        path.addCurve(to: CGPoint(x: 0.92602*width, y: 0.49393*height), control1: CGPoint(x: 0.73828*width, y: 0.07391*height), control2: CGPoint(x: 0.92194*width, y: 0.25855*height))
        path.addCurve(to: CGPoint(x: 0.80278*width, y: 0.79623*height), control1: CGPoint(x: 0.92799*width, y: 0.60553*height), control2: CGPoint(x: 0.88422*width, y: 0.71507*height))
        path.addLine(to: CGPoint(x: 0.80278*width, y: 0.79623*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.50789*width, y: 0.03333*height))
        path.addLine(to: CGPoint(x: 0.49963*width, y: 0.03333*height))
        path.addCurve(to: CGPoint(x: 0.16839*width, y: 0.17536*height), control1: CGPoint(x: 0.37463*width, y: 0.03536*height), control2: CGPoint(x: 0.25697*width, y: 0.08609*height))
        path.addCurve(to: CGPoint(x: 0.0334*width, y: 0.50814*height), control1: CGPoint(x: 0.0792*width, y: 0.26667*height), control2: CGPoint(x: 0.03125*width, y: 0.38435*height))
        path.addCurve(to: CGPoint(x: 0.49211*width, y: 0.96667*height), control1: CGPoint(x: 0.03787*width, y: 0.7658*height), control2: CGPoint(x: 0.23936*width, y: 0.96667*height))
        path.addLine(to: CGPoint(x: 0.50034*width, y: 0.96667*height))
        path.addCurve(to: CGPoint(x: 0.83163*width, y: 0.82464*height), control1: CGPoint(x: 0.62539*width, y: 0.96466*height), control2: CGPoint(x: 0.74303*width, y: 0.91391*height))
        path.addCurve(to: CGPoint(x: 0.9666*width, y: 0.49188*height), control1: CGPoint(x: 0.92082*width, y: 0.73536*height), control2: CGPoint(x: 0.96875*width, y: 0.61768*height))
        path.addCurve(to: CGPoint(x: 0.50789*width, y: 0.03333*height), control1: CGPoint(x: 0.96213*width, y: 0.23623*height), control2: CGPoint(x: 0.76064*width, y: 0.03333*height))
        path.addLine(to: CGPoint(x: 0.50789*width, y: 0.03333*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.50085*width, y: 0.45*height))
        path.addLine(to: CGPoint(x: 0.49996*width, y: 0.45*height))
        path.addCurve(to: CGPoint(x: 0.46447*width, y: 0.46522*height), control1: CGPoint(x: 0.48657*width, y: 0.45022*height), control2: CGPoint(x: 0.47396*width, y: 0.45565*height))
        path.addCurve(to: CGPoint(x: 0.45001*width, y: 0.50087*height), control1: CGPoint(x: 0.45491*width, y: 0.475*height), control2: CGPoint(x: 0.44978*width, y: 0.48761*height))
        path.addCurve(to: CGPoint(x: 0.49915*width, y: 0.55*height), control1: CGPoint(x: 0.45049*width, y: 0.52848*height), control2: CGPoint(x: 0.47207*width, y: 0.55*height))
        path.addLine(to: CGPoint(x: 0.50004*width, y: 0.55*height))
        path.addCurve(to: CGPoint(x: 0.53553*width, y: 0.53478*height), control1: CGPoint(x: 0.51343*width, y: 0.54978*height), control2: CGPoint(x: 0.52604*width, y: 0.54435*height))
        path.addCurve(to: CGPoint(x: 0.54999*width, y: 0.49913*height), control1: CGPoint(x: 0.54509*width, y: 0.52522*height), control2: CGPoint(x: 0.55022*width, y: 0.51261*height))
        path.addCurve(to: CGPoint(x: 0.50085*width, y: 0.45*height), control1: CGPoint(x: 0.54951*width, y: 0.47174*height), control2: CGPoint(x: 0.52793*width, y: 0.45*height))
        path.addLine(to: CGPoint(x: 0.50085*width, y: 0.45*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.80724*width, y: 0.79925*height))
        path.addCurve(to: CGPoint(x: 0.83351*width, y: 0.77464*height), control1: CGPoint(x: 0.81625*width, y: 0.79141*height), control2: CGPoint(x: 0.82502*width, y: 0.7832*height))
        path.addCurve(to: CGPoint(x: 0.83677*width, y: 0.77135*height), control1: CGPoint(x: 0.83461*width, y: 0.77355*height), control2: CGPoint(x: 0.83569*width, y: 0.77245*height))
        path.addCurve(to: CGPoint(x: 0.50978*width, y: 0.63333*height), control1: CGPoint(x: 0.75389*width, y: 0.68595*height), control2: CGPoint(x: 0.63848*width, y: 0.63333*height))
        path.addLine(to: CGPoint(x: 0.50152*width, y: 0.63333*height))
        path.addCurve(to: CGPoint(x: 0.17027*width, y: 0.77536*height), control1: CGPoint(x: 0.37651*width, y: 0.63536*height), control2: CGPoint(x: 0.25886*width, y: 0.68609*height))
        path.addCurve(to: CGPoint(x: 0.16667*width, y: 0.77909*height), control1: CGPoint(x: 0.16906*width, y: 0.7766*height), control2: CGPoint(x: 0.16786*width, y: 0.77784*height))
        path.addCurve(to: CGPoint(x: 0.19717*width, y: 0.80774*height), control1: CGPoint(x: 0.17639*width, y: 0.78911*height), control2: CGPoint(x: 0.18657*width, y: 0.79867*height))
        path.addCurve(to: CGPoint(x: 0.1991*width, y: 0.8058*height), control1: CGPoint(x: 0.19781*width, y: 0.80709*height), control2: CGPoint(x: 0.19846*width, y: 0.80644*height))
        path.addCurve(to: CGPoint(x: 0.50223*width, y: 0.67391*height), control1: CGPoint(x: 0.28022*width, y: 0.72261*height), control2: CGPoint(x: 0.38788*width, y: 0.67594*height))
        path.addLine(to: CGPoint(x: 0.50978*width, y: 0.67391*height))
        path.addCurve(to: CGPoint(x: 0.80724*width, y: 0.79925*height), control1: CGPoint(x: 0.62678*width, y: 0.67391*height), control2: CGPoint(x: 0.73174*width, y: 0.72154*height))
        path.addLine(to: CGPoint(x: 0.80724*width, y: 0.79925*height))
        path.closeSubpath()
        return path
    }
}

@available(iOS 14, macOS 12.0, *)
struct TachoShape_Previews: PreviewProvider {
    static var previews: some View {
        TachoShape().foregroundColor(Color.red)
        .frame(width: 200, height: 200)

    }
}

