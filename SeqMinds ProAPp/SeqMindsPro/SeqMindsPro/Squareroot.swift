import UIKit

class Squareroot: UIViewController {

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
        button.setTitle("Calculate Square Root", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let squareRootLabel: UILabel = {
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
        guard let input = numberTextField.text, let number = Double(input) else {
            squareRootLabel.text = "Please enter a valid number."
            return
        }
        
        let squareRoot = sqrt(number)
        squareRootLabel.text = "Square root of \(number) is \(squareRoot)"
    }
    
    func setupViews() {
        view.addSubview(numberTextField)
        view.addSubview(calculateButton)
        view.addSubview(squareRootLabel)
        
        view.backgroundColor = UIColor.lightBluea // Set the background color of the view
        
        // Set background color for each subview
        numberTextField.backgroundColor = UIColor.lightBluea
        calculateButton.backgroundColor = UIColor.lightBluea
        squareRootLabel.backgroundColor = UIColor.lightBluea
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
            
            squareRootLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            squareRootLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            squareRootLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            squareRootLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

extension UIColor {
    static let lightBluea = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)
}
