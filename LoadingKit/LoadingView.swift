//
//  LoadingView.swift
//  LoadingKit
//
//  Created by James Tang on 24/10/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

import UIKit

@IBDesignable
class LoadingView: UIView {

    @IBInspectable var speed : CGFloat = 0.01
    @IBInspectable var minWidth : CGFloat = 0
    @IBInspectable var maxWidth : CGFloat = 3
    @IBInspectable var progress : CGFloat = 0.5 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var animating : Bool = false {
        didSet {
            if animating {
                self.startAnimation()
            } else {
                self.stopAnimation()
            }
        }
    }

    var displayLink : CADisplayLink?

    func startAnimation() {
        let displayLink = CADisplayLink(target: self, selector: Selector("updateProgress"))
        displayLink.frameInterval = 1
        displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        progress = 0
        self.displayLink = displayLink
    }

    func stopAnimation() {
        progress = 0
        self.displayLink?.invalidate()
        self.displayLink = nil
    }

    override func drawRect(rect: CGRect) {
        LoadingKit.drawLoadingWithTintColor(self.tintColor, rounds: 3, progress: self.progress, minWidth: self.minWidth, maxWidth: self.maxWidth, diameter: min(rect.size.width, rect.size.height) - 4 * self.maxWidth)
    }

    func updateProgress() {
        progress = progress + speed
        if progress > 1 {
            progress = 0
        }
    }

}


