//
//  ViewController.swift
//  DrawSomething
//
//  Created by Anthony Lee on 1/20/19.
//  Copyright © 2019 anthonyLee. All rights reserved.
//

import UIKit

class Canvas: UIView {
    var lines = [[CGPoint]]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(10)
        context.setLineCap(.round)
        
        //Draw the lines 
        lines.forEach { (line) in
            for (i,p) in line.enumerated(){
                if i == 0{
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }

        context.strokePath()
    }
    
    //track movement
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {return}
        
        //Get the last line, add the current point, and add it back to the lines array
        guard var lastline = lines.popLast() else {return}
        lastline.append(point)
        lines.append(lastline)
        
        setNeedsDisplay()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //add a new line when touches begin
        lines.append([CGPoint]())
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let canvas = Canvas()
        canvas.backgroundColor = .white
        view.addSubview(canvas)
        canvas.frame = view.frame
    }


}

