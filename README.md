I have a UITabBarController with 2 tabs.
First tab shows an embedded AVPlayer (via AVPlayerLayer) which I can play/pause via UITapGestureRecognizer (PlayPause button).
Second tab is an UINavigationController to select videos that get displayed via AVPlayerViewController (which gets pushed onto the navigation stack).
 
If the app is about to push the AVPlayerViewController to the stack it pauses the player in the first tab.
If I switch from the second tab to the first one and the second tab currently displays an AVPlayerViewController that one gets paused.
 
My gesture recognizer on tab 1 works perfectly as long as I dont use an AVPlayerViewController. As soon as the app pushed one AVPlayerViewController and I go back to tab 1 and press the play button twice, from the second time on it won't recognize my press anymore.
 
So what happens exactly is:
 
1. Tab 1 embedded AVPlayer plays
2. Play button works perfectly to play/pause the video
3. I switch to tab 2 and select a video.
4. AVPlayer on tab 1 gets paused.
5. An AVPlayerViewController gets pushed onto the navigation stack and starts playing.
6. Play button works perfectly to play/pause the AVPlayerViewController
7. I switch back to tab 1 and the AVPlayerViewController gets paused.
8. I press the play button to resume playback in the embedded AVPlayer in tab 1 - works. AVPlayer resumes.
9. I press the play button again to pause the embedded AVPlayer (which usually works)
10. Method from the play button recognizer won't get called, so I cannot pause the embedded AVPlayer anymore
11. I switch back to tab 2 and notice that I cannot press the play button to resume playback in the AVPlayerViewController. Just pressing the "select button" on the remote works to resume playback.
12. After resuming playback with the select button I can pause the AVPlayerViewController via play button, but after that I only can resume playback with the select button, not the play button

Problem still exists if I pop the AVPlayerViewController from the navigation stack. This means, as soon as I start one AVPlayerViewController the gesture recognizer on tab 1 doesn't work perfectly anymore, even if the AVPlayerViewController is gone already.

I noticed that if I set "showsPlaybackControls = false" after creating the AVPlayerViewController and before pushing it to the navigation stack the gesture recognizer continues to work. But thats of course not really a solution for me, because I want playback controls on the AVPlayerViewController.

The problem starts as soon as I call "play()" on the embedded AVPlayer. If I delete the row that calls "play()" after pressing the play button the gesture recognizer continues calling its method.

Anybody got the same problem or knows what's going on?

Btw. no problem in simulator, just on a real device.
