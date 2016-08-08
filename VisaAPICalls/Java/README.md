Preparation
===========================================
1. Pre-requisite packages to be installed:go to java/vdp_maven directory and run the command

     mvn install

Running the Cybersource and Visa Checkout sample code
=====================================================
1. Log on to https://developer.visa.com/, go to the Dashboard and click on your app name
2. Copy the API Key and Shared Secret from Keys/APIs tab
3. Replace "put your api key here" in the respective .java file with the API Key from step 2
4. Replace "put your shared secret here" in the respective .java file with the Shared Secret from step 2
5. [a] For Cybersource run CybersourceClient.java
     
   [b] For VisaCheckout run VisaCheckoutClient.java

6. You should see response from the respective API calls

Running the VisaDirect sample code
=====================================================  
1. Log on to https://developer.visa.com/, go to the Dashboard and click on your app name
2. Copy the User ID and Password from the Keys/APIs tab
3. Download the cert.pem from app details on VDP portal (should be visible under the Certificates when you click on the app name in Dashboard and go to Keys/APIs)
4. Replace "{put your user id here}" with the user id from step 2
5. Replace "{put your password here}" with the password from step 2
6. Replace "{put the path to the keystore file here}" with the path to the keystore file
7. Replace "{put the keystore password}" with the path to the keystore password
8. Replace "{put the private key password here}" with the private key password
9. Run VisaDirectClient.java
10. You should see response from the VisaDirect API call
11. To know more about generation of keystore file and CSR upload to create app, go to https://developer.visa.com/vdpguide#gettingStarted
