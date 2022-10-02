import numpy


# test comment

numpy.amax

def function(test: str):
    return test


class MyPythonClass(object):
    """
    test test
    """
    id = ""
    attr = None

    def __init__(self, id) -> None:
        self.id = id
        self.created = True

    def aMethod(self, arg) -> None:
        print("entering method")
        self.attr = arg
        print(f"set attr with argument {arg}")


test = function(1)
if __name__ == "__main__":
    a = 2 + 1
    myStr = function("coucou")
    instance = MyPythonClass("identifier")
