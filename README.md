<img src="myapp\lib\images\bLOCK_logo.png" width=250>

bLOCK is a cross-platform Web3 application that allows professional engineers/scientists to upload scans of their engineering/laboratory notebooks (or other intellectual property) to guard against scientific misconduct and assist with intellectual property defense and patenting.

The majority of the app was developed using Flutter & Dart and is available for use on AndroidOS, iOS, macOS, and Windows. User sign in & registration uses Google Firebase with 2-factor Google Authentication. The IPFS (InterPlanetary File System) API was used to store, retrieve, and share files through a secure blockchain. 

## UI

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

## Testing
### Internal Testing
1. The application must be able to be installed on devices from the app store.
2. Upload Testing
    - Run 12 trials of uploading files of 10 kB,  1 MB, 10 MB
    - Record speed of upload for each trial (milliseconds).
    - Criteria
        -  All uploads should be successful with no information loss or corruption. All uploads should be encrypted.
        -  With regular/consistent internet connection, upload speed should be ~2 Mbps or faster  
3. Download/Share Testing
   - Run 12 trials of downloading files of 10 kB,  1 MB, 10 MB
   - Record speed of download for each trial (milliseconds).
   - Criteria
     - All downloads should be successful with no information loss or corruption.
     - With regular/consistent internet connection, download speed should be ~4 Mbps or faster

### Field Testing
1. Each subject will install the application on their phone or use an emulator.
2. Each subject will screen record their use of the application.
3. The subject will create an account and login.
4. The subject will explore the app and must at least utilize the following features:
   - Scan photo
   - Upload file
   - View/search through past files
   - Share file
5. At the end, each subject will fill out a feedback questionnaire.
6. The 1-5 ratings and other feedback will be used to determine the effectiveness of the product as well as any additional improvements required.

### Testing Results
<img src="myapp\lib\images\upload_latency.jpg" width=600>
<img src="myapp\lib\images\download_latency.jpg" width=600>

All files were successfully uploaded/downloaded with no data loss or corruption. On average, image file sizes used with the application are only around 10KB, so the average upload and download latency are only about 31.247 ms (0.031247 seconds) and 15.817 ms (0.015817 seconds), respectively. Larger file sizes 1 MB and 10 MB were also tested for cases in which the user would upload longer documents. The upload latency scaled up as expected (e.g. on average the 10MB file took ~10x longer than the 1MB file for both upload and download), meaning the upload/download speed stayed roughly consistent.

### Statistical Analysis
Latency (ms) can be converted to to upload/download speed (Mbps) using the formula:
8 * [*file size in MB*] / (*latency in ms* / 1000)

## Future Developments
- Improved UI/UX
- Custom Blockchain Node Network to Replace IPFS
- File Backup using MongoDB

## Additional Links
Paper: (https://docs.google.com/document/d/1K0S3tskfX3ZkAxJKy8XR1DOzztoP8xmheaCfkkBo4Oo/edit?usp=sharing) <br />
Presentation: (https://docs.google.com/presentation/d/13jEVqKGnPmU0WxrpHiKAvqYtfA0RF4cjsSinkRjDk0o/edit?usp=sharing) <br />
