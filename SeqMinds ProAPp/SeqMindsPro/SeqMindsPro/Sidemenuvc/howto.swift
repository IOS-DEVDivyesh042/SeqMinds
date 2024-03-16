


import UIKit

class howto: UIViewController {

    @IBOutlet weak var txtde: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        txtde.layer.cornerRadius = 2
        txtde.layer.borderColor = UIColor.black.cgColor
        txtde.layer.borderWidth = 5
       
    }
    


}
