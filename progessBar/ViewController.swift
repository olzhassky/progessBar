import UIKit
import SnapKit

class ViewController: UIViewController {
    var progressBar: CustomProgressBar!
    var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
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
    }
    
    private func setupConstraints() {
        progressBar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-30)
            make.width.equalTo(300)
            make.height.equalTo(15)
        }
        
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(progressBar.snp.bottom).offset(30)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
    }
    
    @objc private func startButtonTapped() {
        progressBar.progress = 0
        UIView.animate(withDuration: 1.0) {
            self.progressBar.progress = 1
        }
    }
    
}
