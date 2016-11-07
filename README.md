# GradientLabel
This is a label with color gradient effects. It has a variety of special effects to choose from, 
it can have a bright light across the surface, it can also be like a rainbow of gorgeous. In addition, it can fade in fade out.
All in all, Choose it for your next project, or migrate over your existing projects, you'll feel it's amazing.

## Attribute
- **text**：(NSString), text displayed on label, default is nil.
- **textColor**：(UIColor),  default is black
- **textAlignment**：(NSTextAlignment), default is NSTextAlignmentCenter
- **font**：(UIFont), the font size of a text. default is system font 24 plain.
- **type**：(GradientType), a type of special effects, default is GradientFlash, GradientType is a custom enumeration used to select a type of specific effect.


## Usage
```objc
#import "GradientLabel.h"

GradientLabel * label = [[GradientLabel alloc]init];
label.translatesAutoresizingMaskIntoConstraints = NO;
[self.view addSubview:label];
[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[label]-15-|" options:NSLayoutFormatDirectionLeftToRight metrics:nil views:@{@"label":label}]];
[self.view addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label(40)]" options:NSLayoutFormatDirectionLeftToRight metrics:nil views:@{@"label":label}]]; 
label.text = @"This is a GradientLabel";
label.type = GradientColourFade;
