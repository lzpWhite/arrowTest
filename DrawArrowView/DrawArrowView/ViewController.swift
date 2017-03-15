//
//  ViewController.swift
//  DrawArrowView
//
//  Created by 刘志鹏 on 2017/3/15.
//  Copyright © 2017年 刘志鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let left = createView(frame: CGRect(x: 10, y: 30, width: view.frame.size.width/2-10, height: view.frame.size.height/2-30),
                              dir: LZPArrowView.Direction.left,
                              width: 6,
                              height: 14,
                              color: UIColor.red,
                              string: "左")
        view.addSubview(left)

        let right = createView(frame: CGRect(x: left.frame.maxX+10, y: 30, width: view.frame.size.width/2-20, height: view.frame.size.height/2-30),
                               dir: LZPArrowView.Direction.right,
                               width: 6,
                               height: 14,
                               color: UIColor.yellow,
                               string: "右")
        view.addSubview(right)

        let top = createView(frame: CGRect(x: 10, y: left.frame.maxY+10, width: view.frame.size.width/2-10, height: view.frame.size.height/2-30),
                               dir: LZPArrowView.Direction.top,
                               width: 14,
                               height: 6,
                               color: UIColor.blue,
                               string: "上")
        view.addSubview(top)

        let bottom = createView(frame: CGRect(x: left.frame.maxX+10, y: left.frame.maxY+10, width: view.frame.size.width/2-20, height: view.frame.size.height/2-30),
                             dir: LZPArrowView.Direction.bottom,
                             width: 14,
                             height: 6,
                             color: UIColor.blue,
                             string: "下")
        view.addSubview(bottom)
    }

    func createView(frame: CGRect, dir: LZPArrowView.Direction, width: CGFloat, height: CGFloat, color: UIColor, string: String) -> UIView {
        let view = LZPArrowView(frame: frame)
        view.direction = dir
        view.spaceTriWidth = width
        view.spaceTriHeight = height
        view.color = color
        view.spaceRadio = 10
        view.offSet = 40
        view.beginDraw()

        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = string
        label.sizeToFit()
        label.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        view.addSubview(label)
        return view
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

