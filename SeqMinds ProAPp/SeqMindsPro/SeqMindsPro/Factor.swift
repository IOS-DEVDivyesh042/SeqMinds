import UIKit

class Factor : UIViewController {

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
        button.setTitle("Calculate Factors", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let factorsLabel: UILabel = {
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
            factorsLabel.text = "Please enter a valid number."
            return
        }
        
        let factors = calculateFactors(of: number)
        factorsLabel.text = "Factors of \(number): \(factors)"
    }
    
    func calculateFactors(of number: Int) -> [Int] {
        var factors: [Int] = []
        
        for i in 1...number {
            if number % i == 0 {
                factors.append(i)
            }
        }
        
        return factors
    }
    
    func setupViews() {
        view.addSubview(numberTextField)
        view.addSubview(calculateButton)
        view.addSubview(factorsLabel)
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
            
            factorsLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            factorsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            factorsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            factorsLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
