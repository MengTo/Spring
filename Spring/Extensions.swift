
import UIKit

// Extension on Springable protocol that conforms to UIView (UIButton, UILabel, ...)
extension Springable where Self: UIView {
  
  /**
   Setup your animation preset and curve.
   - Parameters:
      - preset: The animation you want to play (`.ZoomIn`, `.ZoomOut`, `.FadeIn`, ...).
      - curve: The curve you want to apply to your animation (`.EaseIn`, `.EaseOut`, ...).
   - Important: This function only setup preset and curve animation you have to animate it using `yourUIView.animate()` for exemple.
  */
  func animation(preset: Spring.AnimationPreset, curve: Spring.AnimationCurve) {
    self.animation = preset.rawValue
    self.curve = curve.rawValue
  }
}
