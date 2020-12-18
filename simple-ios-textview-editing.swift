import UIKit

class TextFieldEditingDemo: UIViewController,UITextViewDelegate {

    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var txtFname: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtView.delegate = self
        txtFname.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    @objc func textFieldDidChange (){
        if let count = txtFname?.text?.count {
            if(count > 0 )
            {
                btnSave.backgroundColor = .green
            }
            else {
                btnSave.backgroundColor = .none
            }
        }
       
    }
    func textViewDidChange(_ textView: UITextView) { //Handle the text changes here
//        print(textView.text ?? "s"); //the textView parameter is the textView where text was changed
//        }
        if let count = textView.text.count as Int? {
            if(count > 0 )
            {
                btnSave.backgroundColor = .green
            }
            else {
                btnSave.backgroundColor = .none
            }
        }
    }
    


}
