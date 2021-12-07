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
            setupView()
        }
    }
    @IBInspectable
    public var progressBackgroundColor: UIColor? {
        didSet {
            circleLayer.progressBackgroundColor = progressBackgroundColor
            setupView()
        }
    }
    @IBInspectable
    public var progress: CGFloat = 0 {
        didSet {
            circleLayer.progress = progress
            setupView()
        }
    }
    @IBInspectable
    public var progressWidth: CGFloat = 0 {
        didSet {
            circleLayer.progressWidth = progressWidth
            setupView()
        }
    }
    
    private var circleLayer: CircleLayer {
        return layer as! CircleLayer
    }
    private var progressBackgroundLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var centerLayer = CAShapeLayer()
    
    public var gaugeLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    public override class var layerClass: AnyClass {
        return CircleLayer.self
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    public func animateGauge() {
        let gaugeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        gaugeAnimation.fromValue = 0
        gaugeAnimation.toValue = progress
        gaugeAnimation.duration = 0.7
        gaugeAnimation.fillMode = .forwards
        gaugeAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        progressLayer.add(gaugeAnimation, forKey: "strokeEnd")
        
        self.gaugeLabel.text = "\(0) %"
        
        UIView.transition(with: gaugeLabel, duration: 0.7, options: [.curveEaseInOut], animations: { [weak self] in
            guard let strongSelf = self else { return }
            for gauge in 0...Int(strongSelf.progress * 100) {
                print(gauge)
                strongSelf.gaugeLabel.alpha = 0
                strongSelf.gaugeLabel.text = "\(gauge) %"
                strongSelf.gaugeLabel.alpha = 1
            }
            
        }, completion: nil)
    }
    
    private func setupView() {
        layer.sublayers?.removeAll()
        subviews.forEach {
            $0.removeFromSuperview()
        }
        
        
        
        let center = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        
        let radius = min(frame.size.width, frame.size.height) / 2
        
        let centerPath = UIBezierPath(arcCenter: center, radius: radius - progressWidth / 2, startAngle: Degrees(0).toRadians(), endAngle: Degrees(360).toRadians(), clockwise: true)
        
        centerLayer.position = center
        centerLayer.frame = bounds
        centerLayer.path = centerPath.cgPath
        centerLayer.fillColor = UIColor.white.cgColor
        centerLayer.setNeedsDisplay()
        layer.addSublayer(centerLayer)
        
        let progressBackgroundPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: Degrees(0).toRadians(), endAngle: Degrees(360).toRadians(), clockwise: true)
        
        
        progressBackgroundLayer.position = center
        progressBackgroundLayer.frame = bounds
        progressBackgroundLayer.path = progressBackgroundPath.cgPath
        progressBackgroundLayer.fillColor = .none
        progressBackgroundLayer.lineWidth = progressWidth
        progressBackgroundLayer.strokeColor = progressBackgroundColor?.cgColor
        progressBackgroundLayer.lineCap = .round
        progressBackgroundLayer.setNeedsDisplay()
        layer.addSublayer(progressBackgroundLayer)
        
        let progressPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: Degrees(0 - 90).toRadians(), endAngle: Degrees((360 - 90) ).toRadians(), clockwise: true)
        
        progressLayer.position = center
        progressLayer.frame = bounds
        progressLayer.path = progressPath.cgPath
        progressLayer.fillColor = .none
        progressLayer.lineWidth = progressWidth
        progressLayer.strokeColor = progressColor?.cgColor
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = progress
        progressLayer.lineCap = .round
        progressLayer.setNeedsDisplay()
        layer.addSublayer(progressLayer)
        
        gaugeLabel.text = "\(progress * 100) %"
        gaugeLabel.frame = bounds
        gaugeLabel.center = center
        addSubview(gaugeLabel)
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
