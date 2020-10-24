//
//  WelcomeViewController.swift
//  Onboarding Titik Jumpa
//
//  Created by Moh Iwangga Kalih Syah Putra on 10/08/20.
//  Copyright © 2020 Moh Iwangga Kalih Syah Putra. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var holderView: UIView!

    let scrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    private func configure() {
        let scrollView = UIScrollView(frame: holderView.bounds)
        holderView.addSubview(scrollView)
        
        let titles = ["The Time Is Now", "Passcode Login", "Challenge Yourself", "Share Experience"]
        for x in 0..<4 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * holderView.frame.size.width, y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            
           //Judul, Gambar, Tombol
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width-20, height: 120 ))
            
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10+120+10, width: pageView.frame.size.width-20, height: pageView.frame.size.height - 60 ))
            
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height-60, width: pageView.frame.size.width-20, height: 50 ))
            let pageControl = UIPageControl(frame:.zero)
            pageControl.numberOfPages = 4
               pageControl.translatesAutoresizingMaskIntoConstraints = false
            pageControl.currentPage = 0
            pageControl.pageIndicatorTintColor = UIColor.gray
            pageControl.currentPageIndicatorTintColor = UIColor(red: 1.0/225.0, green: 23.0/255.0, blue: 52.0/255.0, alpha: 1.0)
            
            label.textAlignment = .center
            label.textColor = .black
            label.font = UIFont(name: "Helvetica-Bold", size: 32)
            pageView.addSubview(label)
            label.text = titles[x]
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "welcome_\(x+1)")
            pageView.addSubview(imageView)
            
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.setTitle("Continue", for: .normal)
            if x < 3 {
                pageControl.currentPage = x
            button.isHidden = true
            }
            if x == 3 {
                pageControl.currentPage = x
                button.setTitle("Continue", for: .normal)
            }
            button.addTarget(self, action: #selector(didTapButton(button:)), for: .touchUpInside)
            button.tag = x+1
            pageView.addSubview(button)
            
           
            pageView.addSubview(pageControl)
            NSLayoutConstraint.activate([
                pageControl.centerXAnchor.constraint(equalTo: pageView.centerXAnchor),
                pageControl.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20),
            ])
        }
        scrollView.contentSize = CGSize(width: holderView.frame.size.width*4, height: 0)
        scrollView.isPagingEnabled = true
        
        
           
        
    }
    
    @objc func didTapButton( button:UIButton){
               guard button.tag < 3 else {
                   Core.shared.setIsNotNewUser()
                    performSegue(withIdentifier: "toSignUp", sender: nil)
                // Haptic
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                //dismiss(animated: true, completion: nil)
                   return
               }
               scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
               
           }
}
