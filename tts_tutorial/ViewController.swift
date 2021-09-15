//
//  ViewController.swift
//  tts_tutorial
//
//  Created by 小柳智之 on 2021/09/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var speechText: UITextField!

    @IBOutlet weak var startSpeechButton: UIButton!
    
    private var input: TTSPresenterInput!
    func inject(input: TTSPresenter){
        self.input = input
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //view.addSubview(startSpeechButton)
        //view.addSubview(speechText)

        //startSpeechButton.addTarget(self, action: #selector(speechButtonOnTap), for:.touchDown)
        //speechText.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @IBAction func speechButtonOnTap(_ sender: Any) {
        guard let text = speechText.text else {
            return
        }
        input.speechButtonOnTap(text: text)
    }
    
    @IBAction func textFieldDidChange(_ sender: Any) {
        guard let text = speechText.text else {
            return
        }
        input.textDidChange(text: text)
    }

}

extension ViewController: TTSPresenterOutput {
    func changeSpeechButtonEnable(isEnable: Bool) {
        startSpeechButton.isEnabled = isEnable
    }
    
    func showErrorAlert(title: String, message: String) {
        let actionAlert = UIAlertController (title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title:"close", style: .cancel, handler: nil)
        actionAlert.addAction(cancelAction)
        self.present(actionAlert, animated:true, completion: nil)
    }
}

