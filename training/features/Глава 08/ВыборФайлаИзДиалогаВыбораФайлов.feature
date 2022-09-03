﻿# language: ru

@lessons

Функционал: Интерактивная справка. Выбор файла из диалога выбора файлов.

Сценарий: Выбор файла из диалога выбора файлов.

	* Привет! В этом уроке я расскажу тебе про то, как выполнить выбор файла из диалога выбора файлов. Давай откроем второй экземпляр Ванессы в режиме обучения.
		И я открываю Vanessa Automation в режиме обучения

	* Сначала мы поговорим как выполнить выбор файла в тонком клиенте.

	* Загр^узим тестовый пример.
		И я устанавливаю опцию VA в режиме обучения "ПроверкаСинтаксисаВРедакторе" "Истина"
		И я загружаю фичи в VA в режиме обучения "$КаталогИнструментов$\training\features\Примеры\ПримерВыборФайлаИзДиалогаВыбораФайловТонкий.feature"

	* Для того, чтобы подменить результат выбора файла на нужный в тонком и толстом клиенте - надо использовать специальный шаг - и я выбираю файл.
		И Я делаю подсветку текста в редакторе VA в режиме обучения с 8 по 8 строку 'Специальный шаг' подсценарий
	* Этот шаг и спользуется как для выбора файлов для открытия так и для записи.
	* У этого шага один параметр и в него надо передать полный путь к файлу.	
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий "ПолныйПутьКФайлу" 'Полный путь к файлу'

	* Важный момент. Этот шаг надо вызвать до того как появился диалог выбора файлов.
	* То есть этот шаг надо вызвать до того действия, которое приводит к появлению диалога выбора файлов.
		И Я делаю подсветку текста в редакторе VA в режиме обучения с 10 по 11 строку 'Действие, приводящее к выбору файла' подсценарий
	* Если всё сделано правильно, то диалог выбора файлов не должен появиться на экране и сценарий будет выполняться дальше.


	* Теперь поговорим как выполнить выбор файла в web клиенте.
	* Загр^узим тестовый пример.
		И я устанавливаю опцию VA в режиме обучения "ПроверкаСинтаксисаВРедакторе" "Истина"
		И я загружаю фичи в VA в режиме обучения "$КаталогИнструментов$\training\features\Примеры\ПримерВыборФайлаИзДиалогаВыбораФайловWeb.feature"


	* В web клиенте нужно сначала выполнить шаг, который приводит к появлению диалога выбора файла.
		И Я делаю подсветку текста в редакторе VA в режиме обучения с 7 по 8 строку 'Действие, приводящее к выбору файла' подсценарий
	* При этом в браузере должен появиться этот диалог.
	* После этого надо вызвать другой специальный шаг - и я выбираю файл ВК
		И Я делаю подсветку текста в редакторе VA в режиме обучения с 11 по 11 строку 'Специальный шаг для браузера' подсценарий
	* Этот шаг через эмуляцию нажатия клавиш выполняет выбор файла в браузере, поэтому браузер в этот момент должен быть активным окном.
	* Важный момент. Для работы этого шага надо включить использование внешней компоненты VanessaExt.

	* На этом всё, переходи к следующему уроку интерактивной справки.


