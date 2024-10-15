//
//  AlignmentDemo.swift
//  SwiftUI_Study
//
//  Created by 현수 노트북 on 10/15/24.
//

import SwiftUI

struct AlignmentDemo: View {
    var body: some View {
        ZStack(alignment: .myAlignment) {
            Rectangle()
                .foregroundColor(Color.green)
                .alignmentGuide(HorizontalAlignment.myAlignment, computeValue: { d in
                    d[HorizontalAlignment.trailing]
                })
                .alignmentGuide(VerticalAlignment.myAlignment, computeValue: { d in
                    d[VerticalAlignment.bottom]
                })
                .frame(width: 100, height: 100)
            Rectangle()
                .foregroundColor(Color.red)
                .alignmentGuide(VerticalAlignment.myAlignment, computeValue: { d in
                    d[VerticalAlignment.top]
                })
                .alignmentGuide(HorizontalAlignment.myAlignment, computeValue: { d in
                    d[HorizontalAlignment.center]
                })
                .frame(width: 100, height: 100)
            Circle()
                .foregroundColor(Color.orange)
                .alignmentGuide(HorizontalAlignment.myAlignment, computeValue: { d in
                    d[.leading]
                })
                .alignmentGuide(VerticalAlignment.myAlignment, computeValue: { d in
                    d[.bottom]
                })
                .frame(width: 100, height: 100)
        }
    }
}

extension HorizontalAlignment {
    private enum MyHorizontal: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[HorizontalAlignment.center]
        }
    }
    static let myAlignment = HorizontalAlignment(MyHorizontal.self)
}

extension VerticalAlignment {
    private enum MyVertical: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[VerticalAlignment.center]
        }
    }
    static let myAlignment = VerticalAlignment(MyVertical.self)
}

extension Alignment {
    static let myAlignment = Alignment(horizontal: .myAlignment, vertical: .myAlignment)
}

#Preview {
    AlignmentDemo()
}
