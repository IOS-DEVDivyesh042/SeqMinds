

import UIKit

@available(iOS 13.0, *)
class sidemenuTblCell: UITableViewCell {

    @IBOutlet weak var imgSidemenu: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var myview : UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
       
        myview.layer.shadowColor = UIColor.systemGray4.cgColor
                myview.layer.shadowOpacity = 5
                myview.layer.shadowOffset = CGSize(width: -50, height: 15)
                myview.layer.shadowRadius = 5
               // myview.layer.masksToBounds = false
       // myview.layer.borderColor = UIColor.black.cgColor
       // myview.layer.borderWidth = 4
        
        
      

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
       
    }

}
