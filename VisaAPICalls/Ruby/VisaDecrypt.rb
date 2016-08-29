require 'openssl'
require 'base64'
 
def decryptPayload(key, wrappedKey, payload)
  unwrappedKey = decrypt(key, wrappedKey)
  decrypt(unwrappedKey, payload)
end
 
def decrypt(key, data)
  decodedData = Base64.strict_decode64(data)
  # TODO: Check that data is at least bigger than IV length
  if (decodedData.byteslice(0,32) !=
      hmac(key,decodedData.byteslice(32,decodedData.bytesize-32)))
    # TODO: Handle HMAC validation failure
    return 'Validation failure'
  end
  cipher = OpenSSL::Cipher.new('AES-256-CBC')
  cipher.decrypt
  cipher.key = hash(key)
  cipher.iv = decodedData.byteslice(32, 48)
  cipher.update(decodedData.byteslice(48, decodedData.bytesize)) + cipher.final
end
 
def hash(data)
  digest = OpenSSL::Digest::SHA256.new
  digest.update(data)
  digest.digest
end
 
def hmac(key, data)
  OpenSSL::HMAC.digest(OpenSSL::Digest::SHA256.new, key, data)
end

enc_data = "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"

enc_key = "8TFwd8EdgVwwdmrw1RhB53iAbx7qPSSG2RMrrE87pEF4k554jmy3yp8Id6POY4/w8+d5mpWIHGqqjUFfCBDri+vPqMtzAyYVeBjcprvpu/C3D8gcZf1yNy5OhiWjuTuz"

secret_key = "CneQCEN+LnqLkZMd7YbqQ9ok/uNdq$JIxJo#Jvzx"
api_key = "C09MZZH3L3SSCCCIO1OC13w2pYKU-naO2V3q-rEf4KerLkdjA"

# puts decrypt(key, data)

# puts decryptPayload(key, shared, data)

puts decryptPayload(secret_key, enc_key, enc_data)

# puts decryptPayload(key, password, data)