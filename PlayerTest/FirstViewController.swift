import UIKit
import AVKit

class FirstViewController: UIViewController {

    var player: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.player = AVPlayer(url: URL(string: movie_url)!)
        let layer = AVPlayerLayer(player: self.player)
        layer.frame = CGRect(origin: .zero, size: CGSize(width: 800, height: 800))
        self.view.layer.addSublayer(layer)
        
        let playPauseButtonRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.playPauseButton(_:)))
        playPauseButtonRecognizer.allowedPressTypes = [NSNumber(value: UIPressType.playPause.rawValue as Int)]
        self.view.addGestureRecognizer(playPauseButtonRecognizer)
        
        self.player.play()
    }
    
    func playPauseButton(_ sender: UITapGestureRecognizer) {
        if self.player.rate == 0.0 {
            self.player.play()
        } else {
            self.player.pause()
        }
    }

}

