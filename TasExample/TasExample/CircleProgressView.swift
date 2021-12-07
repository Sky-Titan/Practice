//
//  CircleProgressView.swift
//  TasExample
//
//  Created by 박준현 on 2021/12/05.
//

import UIKit
import TasUtility


public class CircleProgressView: UIView {
    
    @IBInspectable
    public var progressColor: UIColor? {
        didSet {
            circleLayer.progressColor = progressColor
        }
    }
    @IBInspectable
    public var progressBackgroundColor: UIColor? {
        didSet {
            circleLayer.progressBackgroundColor = progressBackgroundColor
        }
    }
    @IBInspectable
    public var progress: CGFloat = 0 {
        didSet {
            circleLayer.progress = progress
        }
    }
    @IBInspectable
    public var progressWidth: CGFloat = 0 {
        didSet {
            circleLayer.progressWidth = progressWidth
        }
    }
    
    private var circleLayer: CircleLayer {
        return layer as! CircleLayer
    }
    
    public override class var layerClass: AnyClass {
        return CircleLayer.self
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

class CircleLayer: CALayer {
    
    public var progressWidth: CGFloat = 0
    public var progressColor: UIColor?
    public var progressBackgroundColor: UIColor?
    public var progress: CGFloat = 0
    
    private var progressBackgroundLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var centerLayer = CAShapeLayer()
    
    
    override func draw(in ctx: CGContext) {
        print("draw")
        /*
        let center = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        
        let radius = min(frame.size.width, frame.size.height) / 2
        
        let centerPath = UIBezierPath(arcCenter: center, radius: radius - progressWidth / 2, startAngle: Degrees(0).toRadians(), endAngle: Degrees(360).toRadians(), clockwise: true)
        
        centerLayer.position = center
        centerLayer.frame = bounds
        centerLayer.path = centerPath.cgPath
        centerLayer.fillColor = UIColor.white.cgColor
        centerLayer.setNeedsDisplay()
        
        let progressBackgroundPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: Degrees(0).toRadians(), endAngle: Degrees(360).toRadians(), clockwise: true)
        
        progressBackgroundLayer.position = center
        progressBackgroundLayer.frame = bounds
        progressBackgroundLayer.path = progressBackgroundPath.cgPath
        progressBackgroundLayer.fillColor = .none
        progressBackgroundLayer.lineWidth = progressWidth
        progressBackgroundLayer.strokeColor = progressBackgroundColor?.cgColor
        progressBackgroundLayer.lineCap = .round
        progressBackgroundLayer.setNeedsDisplay()
        
        let progressPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: Degrees(0 - 90).toRadians(), endAngle: Degrees((360 - 90) * progress).toRadians(), clockwise: true)
        
        progressLayer.position = center
        progressLayer.frame = bounds
        progressLayer.path = progressPath.cgPath
        progressLayer.fillColor = .none
        progressLayer.lineWidth = progressWidth
        progressLayer.strokeColor = progressColor?.cgColor
        progressLayer.lineCap = .round
        progressLayer.setNeedsDisplay()
        
        addSublayer(centerLayer)
        addSublayer(progressBackgroundLayer)
        addSublayer(progressLayer)
        
        super.draw(in: ctx)
         */
    }
}
