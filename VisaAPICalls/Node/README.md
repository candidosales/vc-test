Preparation
===========================================
1. Pre-requisite packages to be installed:
     npm install

Running the Cybersource and Visa Checkout sample code
=====================================================
1. Log on to https://developer.visa.com/, go to the Dashboard and click on your app name
2. Copy the API Key and Shared Secret from Keys/APIs tab
3. Replace "put your api key here" in the respective .js file with the API Key from step 2
4. Replace "put your shared secret here" in the respective .js file with the Shared Secret from step 2
5. [a] To run the Cybersource sample, go to the folder containing CybersourceSample.js and run the command:
     
     *node CybersourceSample.js*
   
   [b] To run the Visa Checkout sample, go to the folder containing VisaCheckoutSample.js and run the command:


     *node VisaCheckoutSample.js*
6. You should see response from the respective API calls

Running the VisaDirect sample code
=====================================================  
1. Log on to https://developer.visa.com/, go to the Dashboard and click on your app name
2. Copy the User ID and Password from the Keys/APIs tab to any text editor
3. Download the cert.pem from app details on VDP portal (should be visible under the Certificates when you click on the app name in Dashboard and go to Keys/APIs)
4. Replace "{put your user id here}" with the User ID from step 2
5. Replace "{put your password here}" with the Password from step 2
6. Replace "{put the private key pem file path here}" with the path to the exampled-key.pem
7. Replace "{put the client certificate pem file path here}" with the path to cert.pem
8. To run VisaDirect, go to the folder containing VisaDirectSample.js and run the command:
     
     *node VisaDirectSample.js*
9. You should see response from the VisaDirect API calls
10. To know more about generation of private key and CSR upload to create app, go to https://developer.visa.com/vdpguide#gettingStarted
