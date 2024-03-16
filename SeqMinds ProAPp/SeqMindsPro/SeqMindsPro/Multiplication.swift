import UIKit

class Multiplication: UIViewController {

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
        button.setTitle("Calculate Multiplication", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let multiplicationLabel: UILabel = {
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
            multiplicationLabel.text = "Please enter a valid number."
            return
        }
        
        let multiplication = calculateMultiplication(of: number)
        multiplicationLabel.text = "Multiplication up to \(number):\n\(multiplication)"
    }
    
    func calculateMultiplication(of number: Int) -> String {
        var multiplicationResult = ""
        for i in 1...number {
            let result = i * number
            multiplicationResult += "\(i) * \(number) = \(result)\n"
        }
        return multiplicationResult
    }
    
    func setupViews() {
        view.addSubview(numberTextField)
        view.addSubview(calculateButton)
        view.addSubview(multiplicationLabel)
        
        view.backgroundColor = UIColor.lightBlues // Set the background color of the view
        
        // Set background color for each subview
        numberTextField.backgroundColor = UIColor.lightBlues
        calculateButton.backgroundColor = UIColor.lightBlues
        multiplicationLabel.backgroundColor = UIColor.lightBlues
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
            
            multiplicationLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            multiplicationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            multiplicationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            multiplicationLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

extension UIColor {
    static let lightBlues = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)
}
