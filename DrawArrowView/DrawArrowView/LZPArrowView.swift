//
//  LZPArrowView.swift
//  WebViewTest
//
//  Created by 刘志鹏 on 2017/3/15.
//  Copyright © 2017年 刘志鹏. All rights reserved.
//  带有尖头的view

import UIKit

class LZPArrowView: UIView {

    // 尖头的方向
    enum Direction: Int {
        case top = 1, bottom, left, right
    }

    // 三角形的左右间距。默认:7
    var spaceTriWidth: CGFloat = 7
    // 三角形的上下间距。默认:6
    var spaceTriHeight: CGFloat = 6
    // 四个角的弧度。默认:4
    var spaceRadio: CGFloat = 4
    // 颜色。默认:黑色透明度0.6
    var color: UIColor = UIColor.black.withAlphaComponent(0.6)
    // 箭头的方向。默认:向上
    var direction: Direction = .top
    // 箭头的偏移量。如果箭头向上或者向下表示距离左边间距。如果箭头左右表示距离上面的间距(箭头的中心点)
    var offSet: CGFloat?

    // 设置好参数后，开始画图
    func beginDraw() {
        self.backgroundColor = UIColor.clear
        let cornerBG = CAShapeLayer()
        cornerBG.fillColor = color.cgColor
        var path: UIBezierPath?

        switch direction {
        case .top:
            path = drawTop()
        case .bottom:
            path = drawBottom()
        case .left:
            path = drawLeft()
        case .right:
            path = drawRight()
        }
        cornerBG.path = path?.cgPath
        self.layer.insertSublayer(cornerBG, at: 0)
    }

    // MARK: - 画图片

    // 箭头向上
    private func drawTop() -> UIBezierPath {
        var halfWidth = frame.size.width/2
        if let offSet = offSet {
            halfWidth = offSet
        }
        let bezierPath: UIBezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: halfWidth - spaceTriWidth / 2, y: spaceTriHeight))
        bezierPath.addLine(to: CGPoint(x: halfWidth, y: 0))
        bezierPath.addLine(to: CGPoint(x: halfWidth + spaceTriWidth / 2, y: spaceTriHeight))
        bezierPath.addLine(to: CGPoint(x: frame.size.width - spaceRadio, y: spaceTriHeight))
        // 右上角半圆
        bezierPath.addArc(withCenter: CGPoint(x: frame.size.width - spaceRadio, y: spaceTriHeight + spaceRadio),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI_2 * 3.0),
                          endAngle: CGFloat(M_PI * 2.0),
                          clockwise: true)
        bezierPath.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height - spaceRadio))
        // 右下角半圆
        bezierPath.addArc(withCenter: CGPoint(x: frame.size.width - spaceRadio, y: frame.size.height - spaceRadio),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI * 2.0),
                          endAngle: CGFloat(M_PI_2),
                          clockwise: true)
        bezierPath.addLine(to: CGPoint(x: spaceRadio, y: frame.size.height))
        // 左下角半圆
        bezierPath.addArc(withCenter: CGPoint(x: spaceRadio, y: frame.size.height - spaceRadio),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI_2),
                          endAngle: CGFloat(M_PI),
                          clockwise: true)
        bezierPath.addLine(to: CGPoint(x: 0, y: spaceTriHeight + spaceRadio))
        // 左上角半圆
        bezierPath.addArc(withCenter: CGPoint(x: spaceRadio, y: spaceTriHeight + spaceRadio),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI),
                          endAngle: CGFloat(M_PI_2*3.0),
                          clockwise: true)
        bezierPath.close()
        return bezierPath
    }

    // 箭头向下
    private func drawBottom() -> UIBezierPath {
        var halfWidth = frame.size.width/2
        if let offSet = offSet {
            halfWidth = offSet
        }
        let bezierPath: UIBezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: halfWidth - spaceTriWidth / 2, y: frame.size.height - spaceTriHeight))
        bezierPath.addLine(to: CGPoint(x: halfWidth, y: frame.size.height))
        bezierPath.addLine(to: CGPoint(x: halfWidth + spaceTriWidth / 2, y: frame.size.height - spaceTriHeight))
        bezierPath.addLine(to: CGPoint(x: frame.size.width - spaceRadio, y: frame.size.height - spaceTriHeight))

        // 右下角半圆
        bezierPath.addArc(withCenter: CGPoint(x: frame.size.width - spaceRadio, y: frame.size.height - spaceRadio - spaceTriHeight),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI_2),
                          endAngle: CGFloat(M_PI * 2.0),
                          clockwise: false)
        bezierPath.addLine(to: CGPoint(x: frame.size.width, y: spaceRadio))

        // 右上角半圆
        bezierPath.addArc(withCenter: CGPoint(x: frame.size.width - spaceRadio, y: spaceRadio),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI * 2.0),
                          endAngle: CGFloat(M_PI_2 * 3.0),
                          clockwise: false)
        bezierPath.addLine(to: CGPoint(x: spaceRadio, y: 0))

        // 左上角半圆
        bezierPath.addArc(withCenter: CGPoint(x: spaceRadio, y: spaceRadio),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI_2*3.0),
                          endAngle: CGFloat(M_PI),
                          clockwise: false)
        bezierPath.addLine(to: CGPoint(x: 0, y: frame.size.height - spaceRadio - spaceTriHeight))

        // 左下角半圆
        bezierPath.addArc(withCenter: CGPoint(x: spaceRadio, y: frame.size.height - spaceRadio - spaceTriHeight),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI),
                          endAngle: CGFloat(M_PI_2),
                          clockwise: false)

        bezierPath.close()
        return bezierPath
    }

    // 箭头向左
    private func drawLeft() -> UIBezierPath  {
        var halfHeight = frame.size.height/2
        if let offSet = offSet {
            halfHeight = offSet
        }
        let bezierPath: UIBezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.size.width - spaceTriWidth, y: halfHeight - spaceTriHeight / 2))
        bezierPath.addLine(to: CGPoint(x: frame.size.width, y: halfHeight))
        bezierPath.addLine(to: CGPoint(x: frame.size.width - spaceTriWidth, y: halfHeight + spaceTriHeight / 2))
        bezierPath.addLine(to: CGPoint(x: frame.size.width - spaceTriWidth, y: frame.size.height - spaceRadio))

        // 右下角半圆
        bezierPath.addArc(withCenter: CGPoint(x: frame.size.width - spaceRadio - spaceTriWidth, y: frame.size.height - spaceRadio),
                          radius: spaceRadio,
                          startAngle: CGFloat(0),
                          endAngle: CGFloat(M_PI_2),
                          clockwise: true)
        bezierPath.addLine(to: CGPoint(x: spaceRadio, y: frame.size.height))

        // 左下角半圆
        bezierPath.addArc(withCenter: CGPoint(x: spaceRadio, y: frame.size.height - spaceRadio),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI_2),
                          endAngle: CGFloat(M_PI),
                          clockwise: true)
        bezierPath.addLine(to: CGPoint(x: 0, y: spaceRadio))

        // 左上角半圆
        bezierPath.addArc(withCenter: CGPoint(x: spaceRadio, y: spaceRadio),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI),
                          endAngle: CGFloat(M_PI_2*3.0),
                          clockwise: true)
        bezierPath.addLine(to: CGPoint(x: frame.size.width - spaceRadio - spaceTriWidth, y: 0))

        // 右上角半圆
        bezierPath.addArc(withCenter: CGPoint(x: frame.size.width - spaceRadio - spaceTriWidth, y: spaceRadio),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI_2 * 3.0),
                          endAngle: CGFloat(M_PI * 2.0),
                          clockwise: true)

        bezierPath.close()
        return bezierPath
    }

    // 箭头向右
    private func drawRight() -> UIBezierPath  {
        var halfHeight = frame.size.height/2
        if let offSet = offSet {
            halfHeight = offSet
        }
        let bezierPath: UIBezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: spaceTriWidth, y: halfHeight - spaceTriHeight / 2))
        bezierPath.addLine(to: CGPoint(x: 0, y: halfHeight))
        bezierPath.addLine(to: CGPoint(x: spaceTriWidth, y: halfHeight + spaceTriHeight / 2))
        bezierPath.addLine(to: CGPoint(x: spaceTriWidth, y: frame.size.height - spaceRadio))

        // 左下角半圆
        bezierPath.addArc(withCenter: CGPoint(x: spaceTriWidth + spaceRadio, y: frame.size.height - spaceRadio),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI),
                          endAngle: CGFloat(M_PI_2),
                          clockwise: false)
        bezierPath.addLine(to: CGPoint(x: frame.size.width - spaceRadio, y: frame.size.height))

        // 右下角半圆
        bezierPath.addArc(withCenter: CGPoint(x: frame.size.width - spaceRadio, y: frame.size.height - spaceRadio),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI_2),
                          endAngle: CGFloat(M_PI * 2.0),
                          clockwise: false)
        bezierPath.addLine(to: CGPoint(x: frame.size.width, y: spaceRadio))

        // 右上角半圆
        bezierPath.addArc(withCenter: CGPoint(x: frame.size.width - spaceRadio, y: spaceRadio),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI * 2.0),
                          endAngle: CGFloat(M_PI_2 * 3.0),
                          clockwise: false)
        bezierPath.addLine(to: CGPoint(x: frame.size.width - spaceRadio - spaceTriWidth, y: 0))

        // 左上角半圆
        bezierPath.addArc(withCenter: CGPoint(x: spaceRadio + spaceTriWidth, y: spaceRadio),
                          radius: spaceRadio,
                          startAngle: CGFloat(M_PI_2*3.0),
                          endAngle: CGFloat(M_PI),
                          clockwise: false)
        
        
        bezierPath.close()
        return bezierPath
    }

}
