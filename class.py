class Square:
    def __init__(self, length, width):  # инициализация класса с двумя аргментами

        self.length = length  # инициализация первого аргумента
        self.width = width  # инициализация второго аргумента

    def area(self):  # инициализация функции
        return self.length * self.width  # возвращаем результат умножения аргументов класса

lengthString = input("What is your length?")  # присваеваем переменной значение введенное юзером с вопросом.
widthString = input("What is your width?")  #

square1 = Square(int(lengthString), int(widthString))  # создаем новый объект класса Square, аргументы переводим в числа

print(square1.area())  # выводим на экран результат вычисления функции класса
