from django.http import JsonResponse


class HttpCode(object):
    ok = 0
    NoContent = 204  # 没有实体的返回
    NotModified = 304  # 请求条件不满足
    ParamsError = 400  # 参数错误
    UnAuth = 401  # 未经授权
    Forbidden = 403  # 被拒绝，没有访问权限
    MethodError = 405  # 方法错误
    ServerError = 500  # 服务器错误


def result(code=HttpCode.ok, message="", data=None, kwargs=None):
    json_dict = {"code": code, "message": message, "data": data}

    if kwargs and isinstance(kwargs, dict) and kwargs.keys():
        json_dict.update(kwargs)

    return JsonResponse(json_dict)


def ok(message=None, data=None):
    return result(code=HttpCode.ok, message=message, data=data)


# 没有返回实体
def no_content(message='', data=None):
    return result(code=HttpCode.NoContent, message=message, data=data)


# 请求条件不满足
def not_modified(message='', data=None):
    return result(code=HttpCode.NotModified, message=message, data=data)


# 参数错误
def params_error(message="", data=None):
    return result(code=HttpCode.ParamsError, message=message, data=data)


# 未经授权
def un_auth(message="", data=None):
    return result(code=HttpCode.UnAuth, message=message, data=data)


# 被拒绝，没有访问权限
def forbidden(message="", data=None):
    return result(code=HttpCode.Forbidden, message=message, data=data)


# 方法错误
def method_error(message='', data=None):
    return result(code=HttpCode.MethodError, message=message, data=data)


# 服务器错误
def server_error(message='', data=None):
    return result(code=HttpCode.ServerError, message=message, data=data)
