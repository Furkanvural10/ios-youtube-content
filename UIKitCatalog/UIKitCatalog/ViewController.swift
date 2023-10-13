//
//  ViewController.swift
//  UIKitCatalog
//
//  Created by furkan vural on 13.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pushNotificationSwitch: UISwitch!
    @IBOutlet weak var pushNotificationLabel: UILabel!
    @IBOutlet weak var languageSegmentedController: UISegmentedControl!
    @IBOutlet weak var musicVolumeSlider: UISlider!
    @IBOutlet weak var incrementOrDecrementStepper: UIStepper!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    var dataIsComing = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPushNotificationSwitch()
        setupLanguageSegmentedController()
        setupSlider()
        setupStepper()
        setupLoadingView()
    }
    
    private func setupLoadingView() {
        loadingView.color = .orange
        
    }
    
    
    private func setupPushNotificationSwitch() {
        pushNotificationLabel.text = "PN is Off"
        pushNotificationSwitch.isOn = false
        
    }
    
    
    private func setupLanguageSegmentedController() {
        languageSegmentedController.setTitle("Turkish", forSegmentAt: 0)
        languageSegmentedController.setTitle("English", forSegmentAt: 1)
        
        languageSegmentedController.selectedSegmentIndex = 1
        print("Selected Index: \(languageSegmentedController.selectedSegmentIndex) ")
        languageSegmentedController.selectedSegmentTintColor = .orange
        
        
        languageSegmentedController.insertSegment(withTitle: "Russian", at: 2, animated: true)
    }
    
    private func setupSlider() {
        musicVolumeSlider.minimumValue = 0
        musicVolumeSlider.maximumValue = 100
        musicVolumeSlider.value = 0
        print("Current slider value: \(musicVolumeSlider.value)")
        
    }
    
    private func setupStepper() {
        incrementOrDecrementStepper.value = 0
        incrementOrDecrementStepper.minimumValue = 0
        incrementOrDecrementStepper.maximumValue = 5
        incrementOrDecrementStepper.stepValue = 1
    }
   
    
    
    @IBAction func pushNotificationSwitchClicked(_ sender: Any) {
        if pushNotificationSwitch.isOn {
            pushNotificationLabel.text = "PN is On"
        } else {
            pushNotificationLabel.text = "PN is Off"
        }
    }
    
    
    @IBAction func languageSegmentedControllerClicked(_ sender: Any) {
    
        let index = languageSegmentedController.selectedSegmentIndex
        
        switch index {
        case 0:
            print("Tr")
        case 1:
            print("Eng")
        default:
            print("Russion")
        }
        
    }
    
    
    
    @IBAction func musicVolumeSliderClicked(_ sender: Any) {
        
        if musicVolumeSlider.value > 80 {
            print("Bildirim gönder ses çok yüksek")
        }
        
    }
    
    @IBAction func incrementOrDecrementStepperClicked(_ sender: Any) {
        
        print(incrementOrDecrementStepper.value)
        if incrementOrDecrementStepper.value > 4 {
            print("Max sayıya ulaştınız")
        }
        
        
    }
    
    @IBAction func getDataClicked(_ sender: Any) {
        
        if !dataIsComing {
            loadingView.startAnimating()
            dataIsComing = !dataIsComing
        } else {
            loadingView.stopAnimating()
            dataIsComing = !dataIsComing
        }
    }
    
}

