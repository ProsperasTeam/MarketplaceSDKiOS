//
//  MarketplaceViewController.swift
//  MarketplaceViewController
//
//  Created by Angelo Vescio on 07/08/23.
//
//

import UIKit
import WebKit

public class MarketplaceViewController: UIViewController, WKUIDelegate {
    public var apikey = "f0627e97-48fb-456b-ba05-c20ce8c56105"
    public var locale = "es-rMX"
    public var sessionId = "d/fvIRnSFf2gQslGnCVm/pz7u8K5JTkEFY5w7KJ1rSawvF0tFj68wuL+Zuy2DrEkr8I/dqUj27iW0fg4RyMaU+jsqimIAsTVZnJjjYWpymAwyFRXa7rZyk8nz0jL1DWG"
    public var urlBase = "https://creditos-web.prosperas.com"
  //  public var urlBase = "https://dev-prosperas.mdhs.mx/creditos_web/"
    
    private final var sizeMetric : Int = 9
    var topPadding : Int = self.view.safeAreaLayoutGuide
    
    var regresarButton: UIButton      = UIButton(type: UIButton.ButtonType.roundedRect)
    var leaveButton: UIButton      = UIButton(type: UIButton.ButtonType.roundedRect)
    var webView: WKWebView!
    //var topBar : CGRect!
    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            return .portrait
        }
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.modalPresentationStyle = .fullScreen
        
        overrideUserInterfaceStyle = .light
        if (locale == "en-rUS"){
            self.regresarButton.setTitle( "BACK", for: .normal)
            self.leaveButton.setTitle( "EXIT", for: .normal)
        } else {
            self.regresarButton.setTitle( "REGRESAR", for: .normal)
            self.leaveButton.setTitle( "SALIR", for: .normal)
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
        //var topPadding : Int = self.view.safeAreaLayoutGuide
        /*var safeAreaInsets = self.view.safeAreaInsets;
        let topBarLeft = CGRect(x: 0.0,
                            //y: self.view.frame.maxY - (self.view.frame.height),
                                y: safeAreaInsets.top,
                            width: self.view.frame.size.width/2,
                            height: self.view.frame.height/CGFloat(sizeMetric))*/
        
        //let colorView = UIView(frame: topBarLeft)
        //colorView.backgroundColor = .red
        //2. Provide the frame to the button
       // regresarButton.frame = topBarLeft
        
        //3. Customise the view attributes
        regresarButton.addTarget(self, action: #selector(MarketplaceViewController.clickMeTapped), for: UIControl.Event.touchDown)
        
        regresarButton.translatesAutoresizingMaskIntoConstraints = false
        //4. Add the view to the subview
        self.view.addSubview(regresarButton)
        
        let margins = view.layoutMarginsGuide
         NSLayoutConstraint.activate([
            regresarButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            //regresarButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
         ])
        
        if #available(iOS 11, *) {
          let guide = view.safeAreaLayoutGuide
          NSLayoutConstraint.activate([
            regresarButton.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
            //guide.bottomAnchor.constraint(equalToSystemSpacingBelow: regresarButton.bottomAnchor, multiplier: 1.0)
           ])
        } else {
           let standardSpacing: CGFloat = 8.0
           NSLayoutConstraint.activate([
            regresarButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: standardSpacing),
           //bottomLayoutGuide.topAnchor.constraint(equalTo: regresarButton.bottomAnchor, constant: standardSpacing)
           ])
        }
    }
    func createRightTopBar()
    {
        /* let topBarRight = CGRect(x: self.view.frame.size.width/2,
                             y: self.view.frame.maxY - (self.view.frame.height),
                             width: self.view.frame.size.width/2,
                             height: self.view.frame.height/CGFloat(sizeMetric))
         
         //2. Provide the frame to the button
         leaveButton.frame = topBarRight*/
         //3. Customise the view attributes
         leaveButton.addTarget(self, action: #selector(MarketplaceViewController.clickPrevTapped), for: UIControl.Event.touchDown)
         leaveButton.translatesAutoresizingMaskIntoConstraints = false
         //4. Add the view to the subview
         self.view.addSubview(leaveButton)
         
         let margins = view.layoutMarginsGuide
          NSLayoutConstraint.activate([
             //regresarButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
             leaveButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
          ])
         
         if #available(iOS 11, *) {
           let guide = view.safeAreaLayoutGuide
           NSLayoutConstraint.activate([
             leaveButton.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
             //guide.bottomAnchor.constraint(equalToSystemSpacingBelow: regresarButton.bottomAnchor, multiplier: 1.0)
            ])
         } else {
            let standardSpacing: CGFloat = 8.0
            NSLayoutConstraint.activate([
             leaveButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: standardSpacing),
            //bottomLayoutGuide.topAnchor.constraint(equalTo: regresarButton.bottomAnchor, constant: standardSpacing)
            ])
         }
    }
    func createWebview()
    {
        //my code
        let webConfiguration = WKWebViewConfiguration()
                webConfiguration.ignoresViewportScaleLimits = true
                webConfiguration.suppressesIncrementalRendering = true
                webConfiguration.allowsInlineMediaPlayback = true
                webConfiguration.allowsAirPlayForMediaPlayback = false
                webConfiguration.allowsPictureInPictureMediaPlayback = true
                webConfiguration.mediaTypesRequiringUserActionForPlayback = .all
                webConfiguration.requiresUserActionForMediaPlayback = true
        //
        webView = WKWebView(frame: CGRect(x: 0.0, y: self.view.frame.height/CGFloat(sizeMetric), width: self.view.frame.size.width, height: self.view.frame.height - (self.view.frame.height/CGFloat(sizeMetric))), configuration: webConfiguration)
        webView.uiDelegate = self
        self.view.addSubview(webView)
        let myURL = URL(string: urlBase + "?sessionid=\(sessionId)&apikey=\(apikey)&locale=\(locale)")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.load(myURLRequest)
        
        self.view.addSubview(webView)
    }
    func abrirSDK(){
        //my code
        
        
       /* webView = WKWebView(frame:  CGRect(x: 0.0, y: 60, width: self.view.frame.size.width, height: self.view.frame.height), configuration: webConfiguration)
        
        self.view.addSubview(webView)
               view = webView*/

        //
        let myURL = URL(string: urlBase + "?sessionid=\(sessionId)&apikey=\(apikey)&locale=\(locale)")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Mobile/15E148 Safari/604.1"

        webView.load(myURLRequest)
        webView.allowsBackForwardNavigationGestures = true
    }
    @objc func clickMeTapped()
    {
        abrirSDK()
    }
    @objc func clickPrevTapped()
    {
        dismiss(animated: true, completion: nil)
        //self.navigationController?.popToRootViewController(animated: true)
        //self.navigationController?.popViewController(animated: true)
    }
}

