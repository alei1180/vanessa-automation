# language: ru
# encoding: utf-8
#parent uf:
@UF5_формирование_результатов_выполнения_сценариев
#parent ua:
@UA20_формировать_прочие_отчеты

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb
@IgnoreOn836
@IgnoreOn837
@IgnoreOn838
@IgnoreOn839
@IgnoreOn8310
@IgnoreOn8311
@IgnoreOn8312
@IgnoreOn8313
@IgnoreOn8314
@IgnoreOn8315

@tree


Функциональность: Проверка формирования файла состояния активной формы



Сценарий: Проверка формирования файла состояния активной формы
	Дано Я закрыл все окна клиентского приложения
	И я закрываю сеанс TESTCLIENT
	Когда я запускаю служебный сеанс TestClient с ключом TestManager в той же базе
	Дано    Я закрыл все окна клиентского приложения

	Когда Я открываю VanessaAutomation в режиме TestClient со стандартной библиотекой
	
	И я перехожу к закладке с именем "ГруппаНастройки"
	И я перехожу к закладке с именем "СтраницаОтчетыОЗапуске"
	
	И я устанавливаю флаг 'Создавать JSON для каждой ошибки'
	И в поле 'Имя каталога для лога ошибок' я ввожу текст 'C:\Temp\ЛогОшибокVA'
	И я перехожу к следующему реквизиту
	И я устанавливаю флаг с именем 'СобиратьДанныеОСостоянииАктивнойФормыПриОшибке'
	И я устанавливаю флаг с именем 'СобиратьДанныеОСостоянииВсехФормПриОшибке'
	И я запоминаю значение поля с именем "ИмяКаталогаЛогОшибок" как "КаталогОшибок"
	
	И я перехожу к закладке с именем "СтраницаСервисОсновные"
	И я перехожу к закладке "Запуск сценариев"
	
	И я загружаю служебную фичу и устанавливаю настройки
			И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ФичаДляПроверкиПолученияСостоянияАктивнойФормы"
			И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Automation TestClient
			И Я нажимаю на кнопку выполнить сценарии в Vanessa-Automation TestClient
	
	Затем количество файлов в каталоге "C:\Temp\ЛогОшибокVA" я запоминаю как "КоличествоФайлов"	
	Тогда переменная "КоличествоФайлов" имеет значение 3
	

	
Сценарий: Закрыть TestClient, который был открыт из второго TestManager. Проверка формирования файла json с ошибкой
	Когда я запускаю служебный сеанс TestClient с ключом TestManager в той же базе
	Дано Я закрыл все окна клиентского приложения кроме "*Vanessa Automation*"
	И я загружаю служебную фичу и устанавливаю настройки
			И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ЗакрытьПодключенныйTestClient/ЗакрытьПодключенныйTestClient"
			И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Automation TestClient
			И Я нажимаю на кнопку выполнить сценарии в Vanessa-Automation TestClient
			И у элемента "Сценарии выполнены" я жду значения "Да" в течение 20 секунд
	И я закрываю TestClient "TM"	
	И в таблице клиентов тестирования я активизирую строку 'Этот клиент'