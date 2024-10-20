//
//  PuzzlePiece.swift
//  PuzzlePieces
//
//  Created by Mark Powell on 9/29/24.
//

import SwiftUI

struct PuzzlePiece: Shape {
    @MainActor private let path: Path = {
#if os(macOS)
        Path(NSBezierPath.jigsawPiece.cgPath)
#else
        Path(UIBezierPath.jigsawPiece.cgPath)
#endif
    }()

    func path(in rect: CGRect) -> Path {
        let multiplier = min(rect.width, rect.height)
        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
        return path.applying(transform)
    }
}

//struct Jigsaw: View {
//    @State private var drawGrid = false
//    let width: CGFloat
//    let height: CGFloat
//
//    var body: some View {
//        let scale = CGAffineTransform(scaleX: width, y: height)
//        Path { path in
//            path.move(to: PiecePoint.startingPoint.applying(scale))
//            PiecePoint.piecePoints.forEach { point in
//                path.addCurve(
//                    to: point.vertex.applying(scale),
//                    control1: point.control1.applying(scale),
//                    control2: point.control2.applying(scale)
//                )
//            }
//        }
//        .fill(.green)
//        .overlay {
//            if drawGrid {
//                Path { path in
//                    for y in stride(from: 0, to: width+1, by: width / 16) {
//                        path.move(to: CGPoint(x: 0, y: y))
//                        path.addLine(to: CGPoint(x: width, y: y))
//                    }
//                    for x in stride(from: 0, to: height+1, by: height / 16) {
//                        path.move(to: CGPoint(x: x, y: 0))
//                        path.addLine(to: CGPoint(x: x, y: height))
//                    }
//                }
//                .stroke(.black)
//            }
//        }
//    }
//}

struct PiecePoint {
    var vertex: CGPoint
    var control1: CGPoint
    var control2: CGPoint

    static let startingPoint = CGPoint(x: 2.0/16 , y: 2.0/16)
    static let piecePoints: [PiecePoint] = [
        PiecePoint(
            vertex: CGPoint(x: 6.5/16, y: 3.0/16),
            control1: CGPoint(x: 4.0/16, y: 3.5/16),
            control2: CGPoint(x: 6.0/16, y: 3.5/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 8.0/16, y: 0.0/16),
            control1: CGPoint(x: 7.0/16, y: 2.0/16),
            control2: CGPoint(x: 4.5/16, y: 0.0/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 9.5/16, y: 3.0/16),
            control1: CGPoint(x: 11.5/16, y: 0.0/16),
            control2: CGPoint(x: 9.0/16, y: 2.0/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 14.0/16, y: 2.0/16),
            control1: CGPoint(x: 10.0/16, y: 3.5/16),
            control2: CGPoint(x: 12.0/16, y: 3.5/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 15.0/16, y: 6.5/16),
            control1: CGPoint(x: 15.0/16, y: 4.0/16),
            control2: CGPoint(x: 15.75/16, y: 5.5/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 12.0/16, y: 8.0/16),
            control1: CGPoint(x: 14.0/16, y: 6.75/16),
            control2: CGPoint(x: 11.75/16, y: 4.5/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 15.0/16, y: 9.5/16),
            control1: CGPoint(x: 11.75/16, y: 11.5/16),
            control2: CGPoint(x: 14.0/16, y: 9.25/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 14.0/16, y: 14.0/16),
            control1: CGPoint(x: 15.75/16, y: 10.5/16),
            control2: CGPoint(x: 15.0/16, y: 12.0/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 9.5/16, y: 13.0/16),
            control1: CGPoint(x: 12.0/16, y: 12.5/16),
            control2: CGPoint(x: 10.0/16, y: 12.5/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 8.0/16, y: 16.0/16),
            control1: CGPoint(x: 9.0/16, y: 14.0/16),
            control2: CGPoint(x: 11.5/16, y: 16.0/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 6.5/16, y: 13.0/16),
            control1: CGPoint(x: 4.5/16, y: 16.0/16),
            control2: CGPoint(x: 7.0/16, y: 14.0/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 2.0/16, y: 14.0/16),
            control1: CGPoint(x: 6.0/16, y: 12.5/16),
            control2: CGPoint(x: 4.0/16, y: 12.5/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 1.0/16, y: 9.5/16),
            control1: CGPoint(x: 1.0/16, y: 12.0/16),
            control2: CGPoint(x: 0.25/16, y: 10.5/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 4.0/16, y: 8.0/16),
            control1: CGPoint(x: 2.0/16, y: 9.25/16),
            control2: CGPoint(x: 4.25/16, y: 11.5/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 1.0/16, y: 6.5/16),
            control1: CGPoint(x: 4.25/16, y: 4.5/16),
            control2: CGPoint(x: 2.0/16, y: 6.75/16)
        ),
        PiecePoint(
            vertex: CGPoint(x: 2.0/16, y: 2.0/16),
            control1: CGPoint(x: 0.25/16, y: 5.5/16),
            control2: CGPoint(x: 1.0/16, y: 4.0/16)
        )
   ]
}

#if os(macOS)
extension NSBezierPath {
    @MainActor
    static var jigsawPiece: NSBezierPath {
        let path = NSBezierPath()
        path.move(to: PiecePoint.startingPoint)
        PiecePoint.piecePoints.forEach { point in
            path.curve(
                to: point.vertex,
                controlPoint1: point.control1,
                controlPoint2: point.control2
            )
        }
        return path
    }
}
#else
extension UIBezierPath {
    static var jigsawPiece: UIBezierPath {
        let path = UIBezierPath()
        path.move(to: PiecePoint.startingPoint)
        PiecePoint.piecePoints.forEach { point in
            path.addCurve(
                to: point.vertex,
                controlPoint1: point.control1,
                controlPoint2: point.control2
            )
        }
        return path
    }
}
#endif
