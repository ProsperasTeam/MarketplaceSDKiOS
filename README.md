# MarketplaceSDK for iOS

## Introduction
The following document provides general documentation applicable across all programming languages for which the Prosperas SDK may be used.

## Podfile

An example podfile is available to you at https://github.com/ProsperasTeam/WebViewiOSBootstrap/blob/main/Podfile

    # Uncomment the next line to define a global platform for your project
    # platform :ios, '9.0'

    target 'Marketplace Webview' do
      # Comment the next line if you don't want to use dynamic frameworks
      use_frameworks!

      # Pods for Marketplace Webview
      pod 'Marketplace', :git => 'https://github.com/ProsperasTeam/MarketplaceSDKiOS.git', :branch => 'release', :tag => '1.0.6'
    
      target 'Marketplace WebviewTests' do
        inherit! :search_paths
        # Pods for testing
      end

      target 'Marketplace WebviewUITests' do
        # Pods for testing
      end
    end

## Calling the Podfile
`pod install`

## Necessary permissions in info.plist

`<key>NSPhotoLibraryUsageDescription</key> `

`<string>You have to describe the real usage for a human.</string>`

## Intial ViewController Setup

A Storyboard is not necessary for popping up the MarketplaceSDK PWA's ViewController. The following demonstrates how to call the view from an initial ViewController


    import UIKit
    import Marketplace

    class ViewController: UIViewController {

      @IBOutlet weak var Button1: UIButton!
      var apikey = ""
      var sessionId = ""
      var locale = ""
    
    
      @IBOutlet weak var apikeyText: UITextField!
    
      @IBOutlet weak var localeText: UITextField!
      @IBOutlet weak var sessionIdText: UITextField!
      override func viewDidLoad() {
          super.viewDidLoad()
          overrideUserInterfaceStyle = .light
        
          apikeyText.text = "YOUR API KEY"
          localeText.text = "es-rMX"
          sessionIdText.text = "Valid User SessionID"

          // Do any additional setup after loading the view.
      }

      @IBAction func goWebView(_ sender: Any) {
        
          let vc = MarketplaceViewController()
          vc.modalPresentationStyle = .fullScreen
          self.present(vc, animated: true)
      }
    }



## Updating
From the terminal, in the root of your project directory, execute the following commands, making sure to completely exit XCode beforehand
`pod deintegrate` 
`pod update`

## Example App
An example application is available to demonstrate how to integrate into your application, for your reference

https://github.com/ProsperasTeam/WebViewiOSBootstrap
