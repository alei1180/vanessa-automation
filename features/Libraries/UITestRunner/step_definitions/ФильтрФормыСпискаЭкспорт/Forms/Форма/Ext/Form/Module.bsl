﻿
///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДляКаждойСтрокиТаблицыОтбораЯУстанавливаюОтборВСписке(ТабПарам)","ДляКаждойСтрокиТаблицыОтбораЯУстанавливаюОтборВСписке","И для каждой строки таблицы отбора я устанавливаю отбор в списке","Шаг выставляет отбор в форме списка, когда уже открыта форма отбора.","UI.Таблицы.Фильтр формы списка");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДляКаждойСтрокиТаблицыОтбораЯУстанавливаюОтборВСпискеЕслиЭтоВозможно(ТабПарам)","ДляКаждойСтрокиТаблицыОтбораЯУстанавливаюОтборВСпискеЕслиЭтоВозможно","И для каждой строки таблицы отбора я устанавливаю отбор в списке если это возможно","Шаг выставляет отбор в форме списка, когда уже открыта форма отбора. Не вызывает исключение, если нет такого фильтра в списке.","UI.Таблицы.Фильтр формы списка");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//И для каждой строки таблицы отбора я устанавливаю отбор в списке
//@ДляКаждойСтрокиТаблицыОтбораЯУстанавливаюОтборВСписке(ТабПарам)
Процедура ДляКаждойСтрокиТаблицыОтбораЯУстанавливаюОтборВСписке(ТабПарам,ВызыватьИсключениеЕслиНетТакогоФильтра = Истина) Экспорт
	//ТабПарам = Ванесса.ПолучитьЗначенияТаблицыGherkinИзКонтекста(ТабПарам);
	
	Для Каждого СтрокаФильтра Из ТабПарам Цикл
		НадоПродолжить = Ложь;
		
		МассивСтрок = Ванесса.РазложитьСтрокуВМассивПодстрокКлиент(СтрокаФильтра.Кол1,".");
		
		АктивноеОкно           = Ванесса.ПолучитьАктивноеОкноИзТестовоеПриложение();
		ТаблицаНастройкаСписка = АктивноеОкно.НайтиОбъект(Тип("ТестируемаяТаблицаФормы"),,"КомпоновщикНастроекПользовательскиеНастройкиЭлемент*ДоступныеПоляТаблица");
		Если ТаблицаНастройкаСписка = Неопределено Тогда
			ТаблицаНастройкаСписка = АктивноеОкно.НайтиОбъект(Тип("ТестируемаяТаблицаФормы"),,"SettingsComposerUserSettingsItem*AvailableFieldsTable");
		КонецЕсли;	 
		КолонкиТаблицаНастройкаСписка = ТаблицаНастройкаСписка.НайтиОбъекты();
		ТаблицаНастройкаСписка.ПерейтиКПервойСтроке();
		Язык = "ru";
		Для Каждого Элем Из КолонкиТаблицаНастройкаСписка Цикл
			Если Найти(Нрег(Элем.ТекстЗаголовка),"field") > 0 Тогда
				Язык = "en";
			КонецЕсли;	 
		КонецЦикла;	 
		
		Ном = 0;
		Для Каждого СтрокаДляПерехода Из МассивСтрок Цикл
			Ном = Ном + 1;
			
			ОписаниеСтроки_ru = Новый Соответствие;
			ОписаниеСтроки_en = Новый Соответствие;
			ОписаниеСтроки_ru.Вставить("Доступные поля",СтрокаДляПерехода);
			ОписаниеСтроки_en.Вставить("Available fields",СтрокаДляПерехода);
			
			
			Попытка
				ТаблицаНастройкаСписка.ПерейтиКСтроке(ОписаниеСтроки_ru,Вычислить("НаправлениеПереходаКСтроке.Вниз"),Ложь);
			Исключение
				Попытка
					ТаблицаНастройкаСписка.ПерейтиКСтроке(ОписаниеСтроки_en,Вычислить("НаправлениеПереходаКСтроке.Вниз"),Ложь);
				Исключение
					
					Если ВызыватьИсключениеЕслиНетТакогоФильтра Тогда
						ВызватьИсключение ОписаниеОшибки();
					Иначе
						НадоПродолжить = Истина;
						Прервать;
					КонецЕсли;	 
				КонецПопытки;
			КонецПопытки;
			
			Если НадоПродолжить Тогда
				Продолжить;
			КонецЕсли;	
			
			ТекущийТекстЯчейки = ТаблицаНастройкаСписка.ПолучитьТекстЯчейки();
			Если ТекущийТекстЯчейки <> СтрокаДляПерехода Тогда
				//Значит не получилось перейти к нужной строке.
				//Но почему-то в этом окне не вызвалось исключение
				Если ВызыватьИсключениеЕслиНетТакогоФильтра Тогда
					ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Не смог перейти к строке фильтра <%1>");
					ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",СтрокаДляПерехода);
					ВызватьИсключение ТекстСообщения;
				Иначе
					НадоПродолжить = Истина;
					Прервать;
				КонецЕсли;	 
			КонецЕсли;	
			
			Если Ном < МассивСтрок.Количество() Тогда
				Попытка
					ТаблицаНастройкаСписка.Развернуть();
					ТаблицаНастройкаСписка.ПерейтиКСледующейСтроке();
				Исключение
				КонецПопытки;
			КонецЕсли;	 
			
		КонецЦикла;	 
		
		Если НадоПродолжить Тогда
			Продолжить;
		КонецЕсли;	
		
		ТЧ = АктивноеОкно.НайтиОбъект(Тип("ТестируемаяТаблицаФормы"),,"КомпоновщикНастроекПользовательскиеНастройкиЭлемент*Отбор");
		//SettingsComposerUserSettingsItem0Filter
		Если ТЧ = Неопределено Тогда
			ТЧ = АктивноеОкно.НайтиОбъект(Тип("ТестируемаяТаблицаФормы"),,"SettingsComposerUserSettingsItem*Filter");
		КонецЕсли;	 
		Кнопка = АктивноеОкно.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"),,"КомпоновщикНастроекПользовательскиеНастройкиЭлемент*ДоступныеПоляВыбрать");
		//SettingsComposerUserSettingsItem0AvailableFieldsChoose
		Если Кнопка = Неопределено Тогда
			Кнопка = АктивноеОкно.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"),,"SettingsComposerUserSettingsItem*AvailableFieldsChoose");
		КонецЕсли;	 
		Кнопка.Нажать();
		
		ЗакладкаОтбор = АктивноеОкно.НайтиОбъект(Тип("ТестируемаяГруппаФормы"),,"КомпоновщикНастроекПользовательскиеНастройкиЭлемент*");
		//SettingsComposerUserSettingsItem0
		Если ЗакладкаОтбор = Неопределено Тогда
			ЗакладкаОтбор = АктивноеОкно.НайтиОбъект(Тип("ТестируемаяГруппаФормы"),,"SettingsComposerUserSettingsItem*");
		КонецЕсли;	 
		ЗакладкаОтбор.Активизировать();
		
		ТЧ.Активизировать();
		ПолеВидСравнения  = ТЧ.НайтиОбъект(Тип("ТестируемоеПолеФормы"),,"КомпоновщикНастроекПользовательскиеНастройкиЭлемент*ОтборВидСравнения");
		//SettingsComposerUserSettingsItem0FilterComparisonType
		Если ПолеВидСравнения = Неопределено Тогда
			ПолеВидСравнения  = ТЧ.НайтиОбъект(Тип("ТестируемоеПолеФормы"),,"SettingsComposerUserSettingsItem*FilterComparisonType");
		КонецЕсли;	 
		ПолеВидСравнения.Активизировать();
		
		ВидСравненияТекст = ТЧ.ПолучитьТекстЯчейки();
		
		ПолеЗначение = ТЧ.НайтиОбъект(Тип("ТестируемоеПолеФормы"),,"КомпоновщикНастроекПользовательскиеНастройкиЭлемент*ОтборПравоеЗначение");
		//SettingsComposerUserSettingsItem0FilterRightValue
		Если ПолеЗначение = Неопределено Тогда
			ПолеЗначение = ТЧ.НайтиОбъект(Тип("ТестируемоеПолеФормы"),,"SettingsComposerUserSettingsItem*FilterRightValue");
		КонецЕсли;	 
		
		ПолеЗначение.Активизировать();
		ТЧ.ИзменитьСтроку();
		ПолеЗначение.ВвестиТекст(СтрокаФильтра.Кол3);
		
		Если НРег(СокрЛП(ВидСравненияТекст)) <> НРег(СокрЛП(СтрокаФильтра.Кол2)) Тогда
			ПолеВидСравнения.Активизировать();
			ПолеВидСравнения.ВвестиТекст(СтрокаФильтра.Кол2);
		КонецЕсли;	 
		
		ТЧ.ЗакончитьРедактированиеСтроки();
	КонецЦикла;	
КонецПроцедуры


&НаКлиенте
//И для каждой строки таблицы отбора я устанавливаю отбор в списке если это возможно
//@ДляКаждойСтрокиТаблицыОтбораЯУстанавливаюОтборВСпискеЕслиЭтоВозможно(ТабПарам)
Процедура ДляКаждойСтрокиТаблицыОтбораЯУстанавливаюОтборВСпискеЕслиЭтоВозможно(ТабПарам) Экспорт
	ДляКаждойСтрокиТаблицыОтбораЯУстанавливаюОтборВСписке(ТабПарам,Ложь);	
КонецПроцедуры
