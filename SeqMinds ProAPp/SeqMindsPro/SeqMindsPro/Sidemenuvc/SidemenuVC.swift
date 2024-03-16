

import UIKit

import StoreKit


class SidemenuVC: UIViewController {

    @IBOutlet weak var tblSidemenu: UITableView!
 
    var arraimg = ["button 4","button 4","button 4","button 4","button 4"]
   
    var labelarray = ["Comments","Confidentiality","Rate","Visit User","User Manual"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        tblSidemenu.delegate = self
        tblSidemenu.dataSource = self
        
        
        
        tblSidemenu.layer.transform = CATransform3DMakeScale(1.1, 0.1, 0.1)
        UIView.animate(withDuration: 1.0,animations: { [self] in
            tblSidemenu.layer.transform = CATransform3DMakeScale(1.0, 1.0,1.0)
            
        }, completion: nil)
    }
  
}

@available(iOS 13.0, *)
extension SidemenuVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tblSidemenu.dequeueReusableCell(withIdentifier: "sidemenuTblCell", for: indexPath) as! sidemenuTblCell
        cell.lblTitle.text = labelarray[indexPath.row]
     
      
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FeedbackVC") as! FeedbackVC
            self.navigationController?.pushViewController(vc, animated: true)
        
        }else if indexPath.row == 1{
            if let link = NSURL(string: "https://www.apple.com") {
                    let objectsToShare = [link] as [Any]
                    let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                    self.present(activityVC, animated: true, completion: nil)
                }
        }
       
        else if indexPath.row == 2 {
            if #available(iOS 10.3, *) {
                  SKStoreReviewController.requestReview()
               } else {
                 
              }

            
            
        }
        else if indexPath.row == 3{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Abtsvc") as! Abtsvc
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 4{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "howto") as! howto
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
}
