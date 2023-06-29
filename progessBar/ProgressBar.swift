import UIKit

class CustomProgressBar: UIView {
    var progress: Double = 0 {
        didSet {
            updateProgress()
        }
    }
    
    private var progressLayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProgressLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupProgressLayer()
    }
    
    private func setupProgressLayer() {
        progressLayer.backgroundColor = UIColor.systemRed.cgColor
        layer.addSublayer(progressLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateProgress()
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }
    
    private func updateProgress() {
        let progressWidth = bounds.width * CGFloat(progress)
        progressLayer.frame = CGRect(x: 0, y: 0, width: progressWidth, height: bounds.height)
    }
}

