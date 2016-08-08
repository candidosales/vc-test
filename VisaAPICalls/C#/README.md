Preparation
===========================================
1. Pre-requisite packages to be installed: Open powershell and run
   dnvm upgrade

Running the Cybersource and Visa Checkout sample code
=====================================================
1. Log on to https://developer.visa.com/, go to the Dashboard and click on your app name
2. Copy the API Key and Shared Secret from Keys/APIs tab to any text editor
3. Replace "put your api key here" in the respective .cs file with the API Key from step 2 
4. Replace "put your shared secret here" in the respective .cs file with the Shared Secret from step 2
5. [a] To run the Cybersource sample, go to the folder containing CybersourceSample.cs and run the command:
        dnx run
   [b] To run the Visa Checkout sample,go to the folder containing VisaCheckoutSample.cs and run the command:
        dnx run
6. You should see response from the respective API calls

Running the VisaDirect sample code
=====================================================  
1. Log on to https://developer.visa.com/, go to the Dashboard and click on your app name
2. Copy the User ID and Password from the Keys/APIs tab to any text editor
3. Download the cert.pem from app details on VDP portal (should be visible under the Certificates when you click on the app name in Dashboard and go to Keys/APIs)
4. Generate P12 file using the below command

	*openssl pkcs12 -export -out p12certfile.p12 -inkey example-key.pem -in cert.pem*
	
	**NOTE:** 
	Use example-key.pem as private key which you have generated at the time of creation of CSR
	Use cert.pem as certificate which you have downloaded at step 3. The above command will prompt for export password. You will need this password for invoking API
	
5. Replace "{put your user id here}" with the User ID from step 2
6. Replace "{put your password here}" with the Password from step 2
7. Replace "{put the path to the P12 file here}" with the path to the P12 file (p12certfile.p12) you have generated at step 4
8. Replace "{put the P12 file password}" with the pass P12 file password that you have set for P12 file at step 4
9. To run the VisaDirect sample, go to the folder containing VisaDirectSample.cs and run the command:
    dnx run
10. You should see response from the VisaDirect API calls
11. To know more about generation of private key(exampled-key.pem) and CSR upload to create app, go to https://developer.visa.com/vdpguide#gettingStarted










