import numpy

# test comment

numpy.amax


def function(test: str):
    return test


def printer(message: str):
    print(message)


class MyPythonClass(object):
    """
    test test
    """
    id = ""
    attr = None

    def __init__(self, id) -> None:
        self.id = id
        self.created = True

    def aMethod(self, arg, third) -> None:
        print("entering method")
        self.attr = arg
        print(f"set attr with argument {arg}")

    def bMethod(self, message):
        printer(message)


test = function(1)
if __name__ == "__main__":
    a = 2 + 1
    myStr = function("coucou")
    instance = MyPythonClass("identifier")
    if a > 3:
        print(a)
    for i in range(5):
        print("coucou")

    printer("a message")
