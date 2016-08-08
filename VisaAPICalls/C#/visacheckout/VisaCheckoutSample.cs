using System;
using System.Linq;
using System.IO;
using System.Net;
using System.Text;
using System.Security.Cryptography;

namespace Visa {
 public class VisaCheckoutSample {
  private static string API_KEY = @"{put your api key here}";
  private static string SHARED_SECRET = @"{put your shared secret here}";
  private static string SAMPLE_CALL_ID = @"{put your call id here}";

  // Shows a sample call to get Visa Checkout "get payment data" API
  public static void Main(string[] args) {
   string baseUri = @"wallet-services-web/";
   string resourcePath = @"payment/data/";
   string url = @"https://sandbox.api.visa.com/" + baseUri + resourcePath + SAMPLE_CALL_ID + "?apikey=" + API_KEY;

   // Create get request object
   HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
   request.Method = "GET";

   // Add headers
   request.ContentType = @"application/json";
   request.Accept = @"application/json";
   string xPayToken = getXPayToken(resourcePath + SAMPLE_CALL_ID,
    "apikey=" + API_KEY,
    "");
   request.Headers.Add("x-pay-token", xPayToken);

   // Make the call
   string responseBody = "";
   try {
    using(HttpWebResponse response = request.GetResponse() as HttpWebResponse) {
     if (response.StatusCode != HttpStatusCode.OK)
      throw new Exception(String.Format(
       "Server error.\n\nStatusCode:{0}\n\nStatusDescription:{1}\n\nResponseHeaders:{2}",
       response.StatusCode,
       response.StatusDescription,
       response.Headers.ToString()));

     Console.WriteLine("Response headers: \n" + response.Headers.ToString());

     var encoding = ASCIIEncoding.ASCII;
     using(var reader = new StreamReader(response.GetResponseStream(), encoding)) {
      responseBody = reader.ReadToEnd();
     }
    }
   } catch (WebException e) {
    Console.WriteLine(e.Message);
   }
   Console.WriteLine("Response body: \n" + responseBody);
  }

  private static string getXPayToken(string apiNameURI, string queryString, string requestBody) {
   string timestamp = getTimestamp();
   string sourceString = timestamp + apiNameURI + queryString + requestBody;
   string hash = getHash(sourceString);
   string token = "xv2:" + timestamp + ":" + hash;
   return token;
  }

  private static string getTimestamp() {
   long timeStamp = ((long) DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc)).TotalMilliseconds) / 1000;
   return timeStamp.ToString();
  }

  private static string getHash(string data) {
   var hashString = new HMACSHA256(Encoding.ASCII.GetBytes(SHARED_SECRET));
   var hashbytes = hashString.ComputeHash(Encoding.ASCII.GetBytes(data));
   string digest = String.Empty;

   foreach(byte b in hashbytes) {
    digest += b.ToString("x2");
   }

   return digest;
  }
 }
}