//
//  ViewController.swift
//  Marketplace Webview
//
//  Created by Angelo Vescio on 7/5/23.
//

import UIKit
import WebKit
//import AVFoundation

class ViewController2: UIViewController {

    var apikey = ""
    var sessionId = ""
    var locale = ""
    var url = "https://google.com"
    
    @IBOutlet weak var regresarButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        if (locale == "en-rUS"){
            self.regresarButton.setTitle( "Back", for: .normal)
        }
        
       /* print("mi info es apikey: \(apikey), locale: \(locale), sessionId: \(sessionId)")
        url = "https://creditos-web.prosperas.com?sessionid=\(sessionId)&apikey=\(apikey)&locale=\(locale)"
        // Do any additional setup after loading the view.
        
        print("url recibida ::: \(url)")
        url = url.replacingOccurrences(of: " ", with: "")
        print("url ajustada ::: \(url)")
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Mobile/15E148 Safari/604.1"
        
        webView.load(NSURLRequest(url: NSURL(string: url)! as URL) as URLRequest)
        webView.allowsBackForwardNavigationGestures = true*/
        abrirSDK()
        
       /* print("mi info es apikey: \(apikey), locale: \(locale), sessionId: \(sessionId)")
        url = "https://creditos-web.prosperas.com?sessionid=\(sessionId)&apikey=\(apikey)&locale=\(locale)"
        // Do any additional setup after loading the view.
        
        print("url recibida ::: \(url)")
        url = url.replacingOccurrences(of: " ", with: "")
        print("url ajustada ::: \(url)")
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Mobile/15E148 Safari/604.1"
        
        webView.load(NSURLRequest(url: NSURL(string: url)! as URL) as URLRequest)
        webView.allowsBackForwardNavigationGestures = true*/
        
    }
    
    func abrirSDK(){
        print("mi info es apikey: \(apikey), locale: \(locale), sessionId: \(sessionId)")
        url = "https://creditos-web.prosperas.com?sessionid=\(sessionId)&apikey=\(apikey)&locale=\(locale)"
        // Do any additional setup after loading the view.
        
        print("url recibida ::: \(url)")
        url = url.replacingOccurrences(of: " ", with: "")
        print("url ajustada ::: \(url)")
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Mobile/15E148 Safari/604.1"
        
        webView.load(NSURLRequest(url: NSURL(string: url)! as URL) as URLRequest)
        webView.allowsBackForwardNavigationGestures = true
    }
    

    @IBAction func regresar(_ sender: Any) {
        abrirSDK()
        
       /* print("mi info es apikey: \(apikey), locale: \(locale), sessionId: \(sessionId)")
          url = "https://creditos-web.prosperas.com?sessionid=\(sessionId)&apikey=\(apikey)&locale=\(locale)"
          // Do any additional setup after loading the view.
          
          print("url recibida ::: \(url)")
          url = url.replacingOccurrences(of: " ", with: "")
          print("url ajustada ::: \(url)")
          webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Mobile/15E148 Safari/604.1"
          
          webView.load(NSURLRequest(url: NSURL(string: url)! as URL) as URLRequest)
          webView.allowsBackForwardNavigationGestures = true*/
    }
    
    /*func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                // Permiso concedido, puedes usar la cámara
            } else {
                // Permiso denegado, no puedes usar la cámara
            }
        }
    }*/
    
}

