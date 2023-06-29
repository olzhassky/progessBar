import UIKit
import SnapKit

class ViewController: UIViewController {
    var progressBar: CustomProgressBar!
    var startButton: UIButton!
    var resetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        // Прогрессбар
        progressBar = CustomProgressBar()
        progressBar.backgroundColor = .systemGray
        progressBar.layer.cornerRadius = 15
        view.addSubview(progressBar)
        
        // Кнопка
        startButton = UIButton(type: .system)
        startButton.setTitle("ТЫК", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.layer.cornerRadius = 15
        startButton.backgroundColor = .systemRed
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        view.addSubview(startButton)
        
        resetButton = UIButton(type: .system)
        resetButton.setTitle("ТЫК2", for: .normal)
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.layer.cornerRadius = 15
        resetButton.backgroundColor = .systemRed
        resetButton.addTarget(self, action: #selector(resetProgress), for: .touchUpInside)
        view.addSubview(resetButton)
        
    }
    
    private func setupConstraints() {
        progressBar.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-30)
            $0.width.equalTo(300)
            $0.height.equalTo(3)
        }
    
        startButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(progressBar.snp.bottom).offset(30)
            $0.width.equalTo(150)
            $0.height.equalTo(30)
        }
        resetButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(startButton.snp.bottom).offset(20)
            $0.width.equalTo(150)
            $0.height.equalTo(30)
        }
        
        
    }
    
    @objc private func startButtonTapped() {
        progressBar.progress = 0
        UIView.animate(withDuration: 0.5) {
            self.progressBar.progress = 1
        }
    }
    @objc private func resetProgress() {
        progressBar.progress = 0
    }
    
}
