//
//  MarketplaceViewController.swift
//  MarketplaceViewController
//
//  Created by Angelo Vescio on 07/08/23.
//
//

import UIKit
import WebKit

class MarketplaceViewController: UIViewController, WKUIDelegate {
    public var apikey = "f0627e97-48fb-456b-ba05-c20ce8c56105"
    public var locale = "es-rMX"
    public var sessionId = "d/fvIRnSFf2gQslGnCVm/pz7u8K5JTkEFY5w7KJ1rSawvF0tFj68wuL+Zuy2DrEkr8I/dqUj27iW0fg4RyMaU+jsqimIAsTVZnJjjYWpymAwyFRXa7rZyk8nz0jL1DWG"
    public var urlBase = "https://creditos-web.prosperas.com"
    
    private final var sizeMetric : Int = 9
    
    var regresarButton: UIButton      = UIButton(type: UIButton.ButtonType.roundedRect)
    var leaveButton: UIButton      = UIButton(type: UIButton.ButtonType.roundedRect)
    var webView: WKWebView!
    //var topBar : CGRect!
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            return .portrait
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        if (locale == "en-rUS"){
            self.regresarButton.setTitle( "Back", for: .normal)
            self.leaveButton.setTitle( "Return to App", for: .normal)
        } else {
            self.regresarButton.setTitle( "Regresar", for: .normal)
            self.leaveButton.setTitle( "Salida", for: .normal)
        }
        self.createUIElements()
    }
    
    //Functions
    func createUIElements()
    {
        self.createWebview()
        self.createTopBar()
    }
    func createTopBar()
    {
        self.createLeftTopBar()
        self.createRightTopBar()
    }
    func createLeftTopBar()
    {
        //1. Specify the dimensions
        let topBarLeft = CGRect(x: 0.0,
                            y: self.view.frame.maxY - (self.view.frame.height),
                            width: self.view.frame.size.width/2,
                            height: self.view.frame.height/CGFloat(sizeMetric))
        
        let colorView = UIView(frame: topBarLeft)
        colorView.backgroundColor = .red
        //2. Provide the frame to the button
        regresarButton.frame = topBarLeft
        
        //3. Customise the view attributes
        regresarButton.addTarget(self, action: #selector(MarketplaceViewController.clickMeTapped), for: UIControl.Event.touchDown)
        
        
        //4. Add the view to the subview
        self.view.addSubview(regresarButton)
    }
    func createRightTopBar()
    {
        let topBarRight = CGRect(x: self.view.frame.size.width/2,
                            y: self.view.frame.maxY - (self.view.frame.height),
                            width: self.view.frame.size.width/2,
                            height: self.view.frame.height/CGFloat(sizeMetric))
        
        //2. Provide the frame to the button
        leaveButton.frame = topBarRight
        //3. Customise the view attributes
        leaveButton.addTarget(self, action: #selector(MarketplaceViewController.clickPrevTapped), for: UIControl.Event.touchDown)
        
        //4. Add the view to the subview
        self.view.addSubview(leaveButton)
    }
    func createWebview()
    {
        webView = WKWebView(frame: CGRect(x: 0.0, y: self.view.frame.height/CGFloat(sizeMetric), width: self.view.frame.size.width, height: self.view.frame.height - (self.view.frame.height/CGFloat(sizeMetric))))
        webView.uiDelegate = self
        self.view.addSubview(webView)
        let myURL = URL(string: urlBase + "?sessionid=\(sessionId)&apikey=\(apikey)&locale=\(locale)")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.load(myURLRequest)
        
        self.view.addSubview(webView)
    }
    func abrirSDK(){
        let myURL = URL(string: urlBase + "?sessionid=\(sessionId)&apikey=\(apikey)&locale=\(locale)")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.load(myURLRequest)
        webView.allowsBackForwardNavigationGestures = true
    }
    @objc func clickMeTapped()
    {
        abrirSDK()
    }
    @objc func clickPrevTapped()
    {
        self.navigationController?.popViewController(animated: true)
    }
}

