//
//  README.swift
//  SPSlider
//
//  Created by Stas Parechyn on 3/23/19.
//

import UIKit

@IBDesignable
public class SPSlider: UIControl {
    /// The direction of the slider
    @IBInspectable public var isHorizontal: Bool = true {
        didSet {
            setNeedsDisplay()
        }
    }
    /// The corner radius of the slider
    @IBInspectable public var radius: CGFloat = 0 {
        didSet {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = radius
        }
    }
    /// The minimum value of the slider
    @IBInspectable public var minimumValue: CGFloat = 0 {
        didSet {
            guard minimumValue < maximumValue else {
                fatalError("Minimum value should be less than maximum value")
            }
            setNeedsDisplay()
        }
    }
    /// The maximum value of the slider
    @IBInspectable public var maximumValue: CGFloat = 1 {
        didSet {
            guard maximumValue > minimumValue else {
                fatalError("Maximum value should be bigger than minimum value")
            }
            setNeedsDisplay()
        }
    }

    private var _value: CGFloat = 0.5 {
        didSet {
            setNeedsDisplay()
            sendActions(for: .valueChanged)
        }
    }
    /// Current value of the slider
    @IBInspectable public var value: CGFloat {
        set {
            _value = (minimumValue...maximumValue).clamp(newValue)
        }
        get { return _value }
    }

    /// The colors used to tint default minimum track
    @IBInspectable public var trackTintColor: UIColor = .init(white: 0.9, alpha: 1.0) {
        didSet {
            setNeedsDisplay()
        }
    }

    public enum Mode {
        case slider
        case line(lineWidth:CGFloat)
    }

    public var currentMode: Mode = .slider {
        didSet {
            setNeedsDisplay()
        }
    }

    // MARK: - Touches

    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let previousLocation = touch.previousLocation(in: self)

            let distance = isHorizontal ? location.x - previousLocation.x : location.y - previousLocation.y

            let range = isHorizontal ? frame.width : frame.height
            let percent = distance / range
            let addValue = percent * (maximumValue - minimumValue)
            self.value += isHorizontal ? addValue : -addValue
        }
    }

    // MARK: - Drawings
    override public func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.saveGState()
        defer { context.restoreGState() }

        // Get slider interval
        let rangeInterval = maximumValue - minimumValue
        // Calculate percent in the interval
        let valuePercent = (abs(minimumValue) + value) / rangeInterval
        let percentValue =  valuePercent > 0 ? valuePercent : 0

        var path: UIBezierPath!
        switch currentMode {
        case .slider: path = getPathForSliderMode(for: percentValue)
        case .line(let lineWidth): path = getPathForLineMode(for: percentValue, lineWidth)
        }

        context.addPath(path.cgPath)
        context.closePath()

        context.setFillColor(trackTintColor.cgColor)
        context.fillPath()
    }

    private func getPathForSliderMode(for percentValue: CGFloat) -> UIBezierPath {
        var rect: CGRect!
        if isHorizontal {
            let width = frame.width
            rect = CGRect(x: -width + (percentValue * width), y: 0, width: width, height: frame.height)
        }
        else {
            let height = frame.height * percentValue
            rect = CGRect(x: 0, y: frame.height - height, width: frame.width, height: frame.height)
        }
        return UIBezierPath(rect: rect)
    }

    private func getPathForLineMode(for percentValue: CGFloat, _ lineWidth: CGFloat) -> UIBezierPath {
        var rect: CGRect!
        if isHorizontal {
            rect = CGRect(x: (percentValue * frame.width) - (lineWidth / 2), y: 0, width: lineWidth, height: frame.height)
        }
        else {
            let height = frame.height
            rect = CGRect(x: 0, y: (height - (height * percentValue)) - (lineWidth / 2), width: frame.width, height: lineWidth)
        }
        return UIBezierPath(rect: rect)
    }
}

fileprivate extension ClosedRange {
    func clamp(_ value : Bound) -> Bound {
        return self.lowerBound > value ? self.lowerBound
            : self.upperBound < value ? self.upperBound
            : value
    }
}
