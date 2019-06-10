
import UIKit

class QueryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var questions: [[String:Any]] = []

    
    
    @IBOutlet weak var query: UITextField!

    
    
// ☓ボタンを押した時
    @IBAction func addWrong(_ sender: Any) {
        let wrongQ: String = query.text!
        questions.append(["question" : wrongQ, "answer" : false])
        UserDefaults.standard.set( questions, forKey: "key" )
    
        self.navigationController?.popToRootViewController(animated: true)
    
    }
    

// ○ボタンを押した時
    @IBAction func addTrue(_ sender: Any) {
        let trueQ: String = query.text!
        questions.append(["question" : trueQ, "answer" : true])
        UserDefaults.standard.set( questions, forKey: "key" )
    
        self.navigationController?.popToRootViewController(animated: true)
        
    
    }

    
}
