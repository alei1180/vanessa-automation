﻿# language: ru
# encoding: utf-8
#parent uf:
@UF9_Вспомогательные_фичи
#parent ua:
@UA25_Макеты_для_отчетов_о_выполнении

@IgnoreOnCIMainBuild


Функциональность: АктуализацияСценариев01
 

Сценарий: АктуализацияСценариев01
	Дано я закрываю сеанс текущего клиента тестирования
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Основная' 'Справочник1'
	Тогда открылось окно 'Справочник1'
	И я нажимаю на кнопку 'Создать'
	Тогда открылось окно 'Справочник1 (создание)'
	И в поле с именем 'Наименование' я ввожу текст 'Тест1'
	И я перехожу к следующему реквизиту
	И я нажимаю на кнопку 'Записать'
	Тогда у элемента формы с именем "Наименование" текст редактирования стал равен 'Тест2'

	