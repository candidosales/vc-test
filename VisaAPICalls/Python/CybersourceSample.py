import vdp_utils
import json

BASE_URL = 'https://sandbox.api.visa.com'


def authorize_credit_card(S):
    uri = '/cybersource/payments/v1/authorizations'
    body = json.loads('''{
        "amount": "10",
        "currency": "USD",
        "payment": {
        "cardNumber": "4111111111111111",
        "cardExpirationMonth": "10",
        "cardExpirationYear": "2016"
        }
    }''')
    r = S.post(BASE_URL + uri, json=body)
    return r


def main():
    api_key = 'put your api key here'
    shared_secret = 'put your shared secret here'
    with vdp_utils.XSession(api_key, shared_secret) as S:
        S.headers.update({'content-type': 'application/json',
                         'accept': 'application/json'})
        r = authorize_credit_card(S)
    print r.status_code
    print r.content


if __name__ == '__main__':
    main()
