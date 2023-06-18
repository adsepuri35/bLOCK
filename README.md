<img src="myapp\lib\images\bLOCK_logo.png">

bLOCK is a cross-platform Web3 application that allows professional engineers/scientists to upload scans of their engineering/laboratory notebooks (or other intellectual property) to guard against scientific misconduct and assist with intellectual property defense and patenting.

The majority of the app was developed using Flutter & Dart and is available for use on AndroidOS, iOS, macOS, and Windows. User sign in & registration uses Google Firebase with 2-factor Google Authentication. The IPFS (InterPlanetary File System) API was used to store, retrieve, and share files through a secure blockchain. 

## User Interface

| Login Page | Register Page | Home Page |
| ------------- | ------------- | ------------- |
| <img src="myapp\lib\images\login_page.jpg">  | <img src="myapp\lib\images\register_page.jpg">  | <img src="myapp\lib\images\home_page.jpg">  |

| Files Page | Account Page | Camera Access |
| ------------- | ------------- | ------------- |
| <img src="myapp\lib\images\files_page.jpg">  | <img src="myapp\lib\images\account_page.jpg">  | <img src="myapp\lib\images\camera_page.jpg">  |

| Blockchain Submission | Blockchain Confirmation | Document View |
| ------------- | ------------- | ------------- |
| <img src="myapp\lib\images\blockchain_submission_page.jpg">  | <img src="myapp\lib\images\blockchain_confirmation.jpg">  | <img src="myapp\lib\images\document_view_page.jpg">  |

## Back-end Flowchart
<img src="myapp\lib\images\flowchart_1.jpg">
<img src="myapp\lib\images\flowchart_2.jpg">

## Flutter Packages
- ipfs_client_flutter 1.0.7
- flutter_ipfs 0.0.2
- share_plus 7.0.2
- image_picker 0.8.7+5
- camera 0.10.5+2 
- path_provider 2.0.15
- path 1.8.3
- firebase_auth 4.6.1
- google_sign_in 6.1.2
- flutter_phoenix 1.1.1
- crypto 3.0.3
- file_picker 5.3.2
- http 1.0.0

## Installation
bLOCK is available for download in the Google Play Store for devices using AndroidOS, App Store for devices using iOS, and available for download as a desktop application for devices using Windows or macOS.

## How to Use
### App Navigation
Use the bottom navigation bar to move between the home, files, and account page.
### Scan & Upload Files
To scan a new file with your camera, press the camera icon in the bottom right corner of either the home or file page. You will be prompted to take a picture: aim your camera at the desired page or object you want to scan, try to fill up as much of the screen as possible; when you are satisfied, take the picture. Repeat this process until you have finished scanning all pages of the document. Then fill out some basic information including the title and an optional description. Once you are done, press complete and the file will be uploaded to the blockchain. Once the file has been uploaded to the blockchain, it cannot be modified or be tampered with. 
### Importing Files & Images
You can also upload files/photos from your phone or Google Drive. To do so, head to the files page and click the “Import Files” or “Import Images” button depending on which you want to upload. You will be prompted to select the files from your Google Drive/phone storage or your camera roll. Then fill out some basic information including the title and an optional description. Once you are done, press complete and the file will be uploaded to the blockchain. Once the file has been uploaded to the blockchain, it cannot be modified or be tampered with.
### Creating Folders
To view previously uploaded files, go to the files page. On this page, all of your uploaded files will be displayed. They can be sorted by upload date, last opened, or title name; you can also search for a specific file using the top search bar. In addition, you can click the “Create Folder” button to create a new folder to organize your files.
### Viewing Files
To view a file more in depth, click on the file in the files page. This will bring you to a document view, showing all of the pages of the file. From here, you will also have the option to share the file to others or download a copy of the file from the blockchain.
### Account Settings
You can head over to the accounts page to view any account details and app settings. You can also seek help or give feedback. Lastly, you are able to sign out of your account on this page.

## Additional Links
Paper: (https://docs.google.com/document/d/1K0S3tskfX3ZkAxJKy8XR1DOzztoP8xmheaCfkkBo4Oo/edit?usp=sharing) <br />
Presentation: (https://docs.google.com/presentation/d/13jEVqKGnPmU0WxrpHiKAvqYtfA0RF4cjsSinkRjDk0o/edit?usp=sharing) <br />
