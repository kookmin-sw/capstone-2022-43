import json
import hscode_request


def lambda_handler(event, context):
    body = {
        'status': 200,
        'message': 'Success to get hscode',
        'hscode': list()
    }
    try:
        code = event['pathParameters']['code']
        body['hscode'] = hscode_request.get_hscode(code)
    except Exception as e:
        print(e)
        body['status'] = 400
        body['message'] = 'Input code is invalid'
        del body['hscode']
    else:
        if not len(body['hscode']):
            body['status'] = 202
            body['message'] = 'Success but no matching data'

    print(body)

    return {
        'statusCode': body['status'],
        'body': json.dumps(body, indent=4, ensure_ascii=False)
    }