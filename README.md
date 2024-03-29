<img src="https://github.com/angelina-tsuboi/Pocket_CPR/blob/main/Pocket_CPR_Banner.png" alt="Pocket CPR Logo" width="450" height="100" />

# Pocket CPR 
A CPR trainer right around your wrist!

## About Pocket CPR 
Pocket CPR is an Apple Watch app that teaches the basics of **Hands-Only** and **Traditional** CPR methods through tutorials and interactive cadence timers.

🧡 **For best experience, Settings > Display & Brightness to Wake for 70** 🧡

⌚️ **Interactive Learning**

The  timers on Pocket CPR include vibrations, pulse animations, and colors to guide you through adminstrating safe, effective CPR. 

🕓 **Cadence Timers**

Hands-Only and Traditional CPR cadence timers are available on Pocket CPR. Learn about proper hand techniques, cadence, and process of CPR. 

💜 **Informative Tutorials**

Pocket CPR includes multiple tutorials that explain proper CPR form, compression rates, Hands-Only CPR, Traditional CPR, and much more.

🏥 **Be Prepared**

It is estimated that more than 659,000 deaths a year occur within the United States due to heart attacks. Employing effective CPR methods can double or triple chances of a victim's survival of a heart attack. Learn CPR using Pocket CPR, and be prepared to save a life.

## Project Structure
``ContentView`` contains the onboarding display with the Hands-Only, Traditional, and "About Pocket CPR" options

``Views/About`` contains all files for the About Page of Pocket CPR which includes a slideshow tutorial explaining the basics of CPR 

``Views/Hands-Only`` contains all files for the Hands-Only Page of Pocket CPR
- ``Views/Hands-Only/HandsOnlyView`` contains options for viewing a Hands-Only CPR timer or tutorial
- ``Views/Hands-Only/HandsOnlyTimer``an interactive cadence timer (pulses and vibrations) for Hands-Only CPR repeating 60 compressions
- ``Views/Hands-Only/HandsOnlyTutorial`` a step-by-step slideshow demonstration of Hands-Only CPR

``Views/Traditional`` contains all files for the Traditional Page of Pocket CPR 
- ``Views/Traditional/TraditionalView`` contains options for viewing a traditional CPR timer or tutorial
- ``Views/Traditional/TraditionalTimer`` an interactive cadence timer alternating between 60 compressions and 2 breaths
- ``Views/Traditional/TraditionalTutorial`` a step-by-step slideshow demonstration of Traditional CPR

``Views/Settings`` includes settings options for Pocket CPR 
- ``Views/Settings/SettingsView`` contains options for toggling vibrations, changing pulse colors, and altering compression rate
- ``Views/Settings/ColorPickerView`` a color picker view for changing the compression and breathing cadence pulses

``Environment`` includes ObservableObject for Settings and a global class containing WatchResolution functions
- ``Environment/UserSettings`` contains a global class for user settings
- ``Environment/SizeResponsive`` includes functions that return values based off of dimensions of user's Apple Watch

## Screenshots
<p float="left">
  <img src="https://github.com/angelina-tsuboi/Pocket_CPR/blob/main/Image_1.png" width="400" />
  <img src="https://github.com/angelina-tsuboi/Pocket_CPR/blob/main/Image_2.png" width="400" /> 
  <img src="https://github.com/angelina-tsuboi/Pocket_CPR/blob/main/Image_3.png" width="400" />
  <img src="https://github.com/angelina-tsuboi/Pocket_CPR/blob/main/Image_4.png" width="400" />
  <img src="https://github.com/angelina-tsuboi/Pocket_CPR/blob/main/Image_5.png" width="400" />
</p>

## Download Pocket CPR
**⌚️ App Store:** [https://apps.apple.com/us/app/pocket-cpr-learn-cpr/id1632751633](https://apps.apple.com/us/app/pocket-cpr-learn-cpr/id1632751633)

**😸 Product Hunt:** [https://www.producthunt.com/posts/pocket-cpr](https://www.producthunt.com/posts/pocket-cpr)
