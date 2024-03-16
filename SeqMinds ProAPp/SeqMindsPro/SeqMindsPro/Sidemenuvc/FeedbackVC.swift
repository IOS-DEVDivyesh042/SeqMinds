
import UIKit


class FeedbackVC: UIViewController {

    @IBOutlet weak var txtFeedback: UITextView!
    @IBOutlet weak var btnshareS : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtFeedback.layer.borderColor =  UIColor.black.cgColor
        txtFeedback.layer.borderWidth = 5
        txtFeedback.layer.cornerRadius = 10

            
        btnshareS.layer.cornerRadius = 20
    }
    
    @IBAction func btnShare(_ sender: UIButton) {
        if(txtFeedback.text!.count == 0) {
            let alert = UIAlertController(title: "Alert", message: "Please Enter Your FeedBack", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default , handler: { (_) in
                
            }))
            self.present(alert, animated: true)
        }
        
        txtFeedback.text = ""
        let alert = UIAlertController(title: "Thanks", message: "Your Feedback Send Successfully!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
