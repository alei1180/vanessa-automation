﻿# language: ru


Feature: Работа с подсценариями. Передача многострочных строк.


Scenario: Работа с подсценариями. Передача многострочных строк.

	И Я вызываю подсценарий и передаю в него многострочные строки
		"""
			НоваяЧастроСтроки1
			НоваяЧастроСтроки2
		"""
		"""
			НоваяЧастроСтроки3
			НоваяЧастроСтроки4
		"""


