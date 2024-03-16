import UIKit

class Prime: UIViewController {

    let numberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter a number"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Check Prime", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let primeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }

    @objc func calculateButtonTapped() {
        guard let input = numberTextField.text, let number = Int(input) else {
            primeLabel.text = "Please enter a valid number."
            return
        }
        
        let isPrime = isPrimeNumber(number)
        primeLabel.text = "Number \(number) is \(isPrime ? "prime" : "not prime")"
    }
    
    func isPrimeNumber(_ number: Int) -> Bool {
        if number <= 1 {
            return false
        }
        
        for i in 2..<number {
            if number % i == 0 {
                return false
            }
        }
        
        return true
    }
    
    func setupViews() {
        view.addSubview(numberTextField)
        view.addSubview(calculateButton)
        view.addSubview(primeLabel)
        
        view.backgroundColor = UIColor.lightBluer // Set the background color of the view
        
        // Set background color for each subview
        numberTextField.backgroundColor = UIColor.lightBluer
        calculateButton.backgroundColor = UIColor.lightBluer
        primeLabel.backgroundColor = UIColor.lightBluer
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            numberTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            numberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            numberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            numberTextField.heightAnchor.constraint(equalToConstant: 100),
            
            calculateButton.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 20),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 100),
            
            primeLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            primeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            primeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            primeLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

extension UIColor {
    static let lightBluer = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)
}
