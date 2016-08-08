import vdp_utils


BASE_URL = 'https://sandbox.api.visa.com'


def get_payment_info(S, call_id, data_level='SUMMARY'):
    uri = '/wallet-services-web/payment/data/' + call_id
    params = {'dataLevel': data_level}
    r = S.get(BASE_URL + uri, params=params)
    return r


def main():
    call_id = 'put your call id here'
    api_key = 'put your api key here'
    shared_secret = 'put your shared secret here'
    with vdp_utils.XSession(api_key, shared_secret) as S:
        S.headers.update({'content-type': 'application/json',
                         'accept': 'application/json'})
        r = get_payment_info(S, call_id)
    print r.status_code
    print r.content


if __name__ == '__main__':
    main()
