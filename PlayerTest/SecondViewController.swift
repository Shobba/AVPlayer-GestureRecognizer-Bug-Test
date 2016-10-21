import UIKit
import AVKit

class SecondViewController: UIViewController {
    
    @IBAction func button(_ sender: AnyObject) {
        if let tabController = UIApplication.shared.keyWindow?.rootViewController as? TabBarController,
            let firstController = tabController.viewControllers?[0] as? FirstViewController {
            firstController.player.pause()
        }
        
        let playerController = AVPlayerViewController()
        playerController.player = AVPlayer(url: URL(string: movie_url)!)
        self.navigationController?.pushViewController(playerController, animated: true)
        playerController.player?.play()
    }
}

