//
//  ViewController.swift
//  ModuleConsumerIOS
//
//  Created by Rakesh Bohara on 28/11/2023.
//

import UIKit
import Flutter

class ViewController: UIViewController {
   
    lazy var flutterEngine = FlutterEngine(name: "fullScreenEngineId")
    
    lazy var textView = UITextView(frame:  CGRect(x: 80.0, y: 310.0, width: 350.0, height: 100.0))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        flutterEngine.run();
        
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
        button.setTitle("Show Flutter", for: UIControl.State.normal)
        button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
        textView.text = "Result"
        self.view.addSubview(textView)
        

    }
    
    @objc func showFlutter(){
        var flutterMethodChannel = FlutterMethodChannel(name: "CHANNEL_DUMMY", binaryMessenger: flutterEngine.binaryMessenger)
        flutterMethodChannel.invokeMethod("METHOD_GET_DUMMY", arguments: "DEFAULT_DATA") { (result: Any?) in
            if let data = result as? String{
                //Success case
                self.textView.text = "Result Received :  \(data)"
            }else{
                //Failed case
            }
        }
    }



}

