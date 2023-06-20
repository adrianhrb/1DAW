# ****************************
# DECORANDO LA SUMA DE VALORES
# ****************************

def result_as_status(func):
    def wrapper(*args, **kwargs):
        rstatus, rresult = func(*args, **kwargs)
        return {'status':rstatus, 'result':rresult}
    return wrapper

@result_as_status
def run(values: list):
    for value in values:
        if not isinstance(value, int):
            return False, 'Not int value found'
    return True, sum(values)


            

