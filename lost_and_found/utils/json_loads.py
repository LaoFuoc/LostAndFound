import json


def decode_data(request):
    return json.loads(request.body.decode())
