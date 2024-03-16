import UIKit

class Crossmulti: UIViewController {

    let numberATextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter number A"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let numberBTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter number B"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate Cross Multiplication", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let crossMultiplicationLabel: UILabel = {
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
        guard let inputA = numberATextField.text, let numberA = Int(inputA),
              let inputB = numberBTextField.text, let numberB = Int(inputB) else {
            crossMultiplicationLabel.text = "Please enter valid numbers."
            return
        }
        
        let crossMultiplicationResult = calculateCrossMultiplication(numberA, numberB)
        crossMultiplicationLabel.text = "Cross Multiplication:\n\(crossMultiplicationResult)"
    }
    
    func calculateCrossMultiplication(_ numberA: Int, _ numberB: Int) -> String {
        let resultA = numberA * numberB
        let resultB = numberA * numberB
        return "\(numberA) * \(numberB) = \(resultA)\n\(numberB) * \(numberA) = \(resultB)"
    }
    
    func setupViews() {
        view.addSubview(numberATextField)
        view.addSubview(numberBTextField)
        view.addSubview(calculateButton)
        view.addSubview(crossMultiplicationLabel)
        
        view.backgroundColor = UIColor.lightBlueo // Set the background color of the view
        
        // Set background color for each subview
        numberATextField.backgroundColor = UIColor.lightBlueo
        numberBTextField.backgroundColor = UIColor.lightBlueo
        calculateButton.backgroundColor = UIColor.lightBlueo
        crossMultiplicationLabel.backgroundColor = UIColor.lightBlueo
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            numberATextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            numberATextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            numberATextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            numberATextField.heightAnchor.constraint(equalToConstant: 100),
            
            numberBTextField.topAnchor.constraint(equalTo: numberATextField.bottomAnchor, constant: 20),
            numberBTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            numberBTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            numberBTextField.heightAnchor.constraint(equalToConstant: 100),
            
            calculateButton.topAnchor.constraint(equalTo: numberBTextField.bottomAnchor, constant: 20),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 100),
            
            crossMultiplicationLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            crossMultiplicationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            crossMultiplicationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            crossMultiplicationLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

extension UIColor {
    static let lightBlueo = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)
}
