//
//  ViewController.swift
//  MKMessageTest
//
//  Created by Srilatha on 2024-10-03.
//

import UIKit
import MessageUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let messageVC = MFMessageComposeViewController()
        messageVC.body = "Your message body here"
        messageVC.recipients = ["1234567890"] // Array of recipient phone numbers
        messageVC.messageComposeDelegate = self // Set the delegate
        
        if MFMessageComposeViewController.canSendText() {
            self.present(messageVC, animated: true, completion: nil)
        } else {
            print("Device cannot send text messages")
        }
    }
}

extension ViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case .cancelled:
            print("Message cancelled")
        case .sent:
            print("Message sent")
        case .failed:
            print("Message failed")
        @unknown default:
            print("Unknown result")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}


