#!/usr/bin/env python3

class Square:
    def __init__(self, width, length):
		self.width = width
        self.length = length

    def area(self):
        return self.width * self.length

square1 = Square(10, 10)
square2 = Square(12, 12)
square3 = Square(100, 100)
