# What is this?
Testing Project, testing the demo shopping website [automation practice](http://automationpractice.com) , using Robot Framework.

## Installation
+ pip installations:
```
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotkernel
```
+ Download selenium web driver for chrome from this [link](https://chromedriver.storage.googleapis.com/index.html?path=87.0.4280.88/)

+ you have to configure its path unzip the downloaded file and go to the extracted folder, then open the terminal and type these two commands:
```  
sudo mv chromedriver /usr/local/bin
export PATH=$PATH:/usr/local/bin/chromedriver
```

## Usage
change directory to the specific file and type: `robot file_name.robot`

## To clear report files
`bash clear.sh`

## Report
For more information, you can refer to the [document](doc/pdf_doc/Testing_Project_Report.pdf)