import UIKit

class Cube: UIViewController {

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
        button.setTitle("Calculate Cube", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let cubeLabel: UILabel = {
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
            cubeLabel.text = "Please enter a valid number."
            return
        }
        
        let cube = pow(number, 3)
        cubeLabel.text = "Cube of \(number) is \(cube)"
    }
    
    func setupViews() {
        view.addSubview(numberTextField)
        view.addSubview(calculateButton)
        view.addSubview(cubeLabel)
        
        view.backgroundColor = UIColor.lightBluec // Set the background color of the view
        
        // Set background color for each subview
        numberTextField.backgroundColor = UIColor.lightBluec
        calculateButton.backgroundColor = UIColor.lightBluec
        cubeLabel.backgroundColor = UIColor.lightBluec
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
            
            cubeLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            cubeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cubeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cubeLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

extension UIColor {
    static let lightBluec = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)
}
