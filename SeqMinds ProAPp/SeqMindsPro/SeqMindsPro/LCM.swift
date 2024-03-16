import UIKit

class LCM: UIViewController {

    let number1TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter first number"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let number2TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter second number"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate LCM", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let lcmLabel: UILabel = {
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
        guard let input1 = number1TextField.text, let number1 = Int(input1),
              let input2 = number2TextField.text, let number2 = Int(input2) else {
            lcmLabel.text = "Please enter valid numbers."
            return
        }
        
        let lcm = calculateLCM(of: number1, and: number2)
        lcmLabel.text = "LCM of \(number1) and \(number2) is \(lcm)"
    }
    
    func calculateLCM(of num1: Int, and num2: Int) -> Int {
        return num1 * num2 / calculateGCD(of: num1, and: num2)
    }
    
    func calculateGCD(of num1: Int, and num2: Int) -> Int {
        var a = num1
        var b = num2
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
    
    func setupViews() {
        view.addSubview(number1TextField)
        view.addSubview(number2TextField)
        view.addSubview(calculateButton)
        view.addSubview(lcmLabel)
        
        view.backgroundColor = UIColor.lightBlueb // Set the background color of the view
        
        // Set background color for each subview
        number1TextField.backgroundColor = UIColor.lightBlueb
        number2TextField.backgroundColor = UIColor.lightBlueb
        calculateButton.backgroundColor = UIColor.lightBlueb
        lcmLabel.backgroundColor = UIColor.lightBlueb
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            number1TextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            number1TextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            number1TextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            number1TextField.heightAnchor.constraint(equalToConstant: 100),
            
            number2TextField.topAnchor.constraint(equalTo: number1TextField.bottomAnchor, constant: 20),
            number2TextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            number2TextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            number2TextField.heightAnchor.constraint(equalToConstant: 100),
            
            calculateButton.topAnchor.constraint(equalTo: number2TextField.bottomAnchor, constant: 20),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 100),
            
            lcmLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            lcmLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lcmLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lcmLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

extension UIColor {
    static let lightBlueb = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)
}
