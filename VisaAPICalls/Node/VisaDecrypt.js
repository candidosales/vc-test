var crypto = require('crypto')
 
function decryptPayload(key, wrappedKey, payload) {
  var unwrappedKey = decrypt(key, wrappedKey);
  return decrypt(unwrappedKey, payload);
}
 
function decrypt(key, data) {
  var dataBuffer = new Buffer(data, 'base64');
  console.log("dataBuffer", dataBuffer);
  // TODO: Check that data is at least bigger than HMAC + IV length
  var hmac = dataBuffer.toString('binary', 0, 32);
  console.log("hmac", hmac);

  var iv = dataBuffer.toString('binary', 32, 48);
  console.log("iv", iv);

  var decodedData = dataBuffer.toString('binary', 48);
  if (hmac != doHmac(key, iv + decodedData)) {
    // TODO: Handle HMAC validation failure
    return 0;
  }
  var cipher = crypto.createDecipheriv('aes-256-cbc', hash(key), iv);
  return cipher.update(decodedData, 'binary', 'binary') + cipher.final('binary');
}
 
function hash(data) {
  var hasher = crypto.createHash('sha256');
  hasher.update(data, 'binary');
  return hasher.digest('binary');
}
 
function doHmac(key, data) {
  var hmacer = crypto.createHmac('sha256', key);
  hmacer.update(data);
  return hmacer.digest('binary');
}


var enc_data = "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"

var enc_key = "tVDKwDpcEOvE4/8833/mJK1htSpNM+smTkcTPJci9GyTGL6m+/Y2ljp038Uk55nQDMi82Ij5pMI9G67i/2N5Lp8pBXnfcCryxFO5u7ijDHrn/0fHwksP+U8l7mGu9UIh"

var secret_key = "CneQCEN+LnqLkZMd7YbqQ9ok/uNdq$JIxJo#Jvzx"

var result = decryptPayload(secret_key, enc_key, enc_data);
console.log(result);