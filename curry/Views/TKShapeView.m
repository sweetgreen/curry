//
//  TKShapeView.m
//  Created by Devin on 6/24/12.
//
/*
 
 curry || https://github.com/devinross/curry
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
*/

#import "TKShapeView.h"

@implementation TKShapeView


+ (Class)layerClass {
    return [CAShapeLayer class];
}
- (CAShapeLayer *) _shapeLayer{
    return (CAShapeLayer *)self.layer;
}



- (CGPathRef) path{
	return [self _shapeLayer].path;
}
- (void) setPath:(CGPathRef)path{
	[self _shapeLayer].path = path;
}

- (CAShapeLayer*) shapeLayer{
	return [self _shapeLayer];
}

- (void) setStrokeColor:(UIColor*)strokeColor{
	self.shapeLayer.strokeColor = strokeColor.CGColor;
}
- (void) setFillColor:(UIColor*)fillColor{
	self.shapeLayer.fillColor = fillColor.CGColor;
}

- (UIColor*) strokeColor{
	return [UIColor colorWithCGColor:self.shapeLayer.strokeColor];
}
- (UIColor*) fillColor{
	return [UIColor colorWithCGColor:self.shapeLayer.fillColor];
}

- (void) setLineWidth:(CGFloat)strokeWidth{
	self.shapeLayer.lineWidth = strokeWidth;
}
- (CGFloat) lineWidth{
	return self.shapeLayer.lineWidth;
}


@end
