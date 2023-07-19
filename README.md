# MarketplaceSDK for iOS

## Introduction
The following document provides general documentation applicable across all programming languages for which the Prosperas SDK may be used.

## Development Environment
* XCode Version: 14.3
* Cocoapods version: 1.12.1
* OSX version: Ventura 13.4

## Further Cocoapod Items
### Stack

```
   CocoaPods : 1.12.1
        Ruby : ruby 2.6.10p210 (2022-04-12 revision 67958) [universal.x86_64-darwin22]
    RubyGems : 3.0.3.1
        Host : macOS 13.4 (22F66)
       Xcode : 14.3.1 (14E300c)
         Git : git version 2.39.2 (Apple Git-143)
Ruby lib dir : /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib
Repositories : cocoapods - git - https://github.com/CocoaPods/Specs.git @ 003926cbc4218843bbc387848ecdb9e2623b5939

               trunk - CDN - https://cdn.cocoapods.org/
```

### Installation Source

```
Executable Path: /usr/local/bin/pod
```

### Plugins

```
cocoapods-deintegrate : 1.0.5
cocoapods-plugins     : 1.0.0
cocoapods-search      : 1.0.1
cocoapods-trunk       : 1.6.0
cocoapods-try         : 1.2.0
```


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

There are four public variables in the MarketplaceViewController class that you will want to set for the ViewController to properly render your application area:
* sessionId
* apikey
* locale
* urlBase


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
              vc.sessionId = sessionIdText.text ?? "Valid Session ID"
              vc.apikey  = apikeyText.text ?? "Valid API Key"
              vc.locale = localeText.text ?? "Valid Locale such as es-rMX or en-rUS"
              vc.urlBase = "https://creditos-web.prosperas.com"
              vc.modalPresentationStyle = .fullScreen
              self.present(vc, animated: true)
          }
        }

## Example Initial ViewController Display with Variables
The following screenshot shows a sample entry screen for variables within your application. Please ensure that you have set the API key, SessionID, and locale according to your own parameters. An API key will come directly from Prosperas in the form of a conformant, randomly-generated UUID. The session ID is a value that is supplied by you, according to the session IDs for your users.
<img src ="https://github.com/ProsperasTeam/MarketplaceSDKiOS/assets/125609244/4d34138c-a315-4bba-b0d6-1bee44e8d15d" width=300px></img>



## Updating
From the terminal, in the root of your project directory, execute the following commands, making sure to completely exit XCode beforehand

    pod deintegrate 
    pod update

## Example App
An example application is available to demonstrate how to integrate into your application, for your reference

https://github.com/ProsperasTeam/WebViewiOSBootstrap

## Troubleshooting
With any integration, there are bound to be issues between Xcode versions, Cocoapod versions. There are multiple itmes outside of Prosperas' control regarding development environments, especially XCode. Here, we enumerate some issues you could run into if your development environment is dissimilar.

### Cocoapod Error
[!] The version of CocoaPods used to generate the lockfile (1.12.1) is higher than the version of the current executable (1.11.3). Incompatibility issues may arise.
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.11.3/lib/cocoapods/user_interface/error_report.rb:34:in `force_encoding’: can’t modify frozen String (FrozenError)

### Cocoapod Solution
From StackOverflow, solution tested on XCode 14.2 and Cocoapods < 1.12: https://stackoverflow.com/questions/74137282/pod-init-error-force-encoding-cant-modify-frozen-string-frozenerror-at

![image](https://github.com/ProsperasTeam/MarketplaceSDKiOS/assets/125609244/43da04bd-156f-4df3-a727-4dbbfe76de17)



