﻿
#Область СлужебныйПрограммныйИнтерфейс

Функция ЛокализованныеСтроки() Экспорт

	ЛокализованныеСтроки = Новый Структура;
	ЛокализованныеСтроки.Вставить("КаталогСОтчетами",     ОписаниеОпцииКаталогСОтчетами());
	ЛокализованныеСтроки.Вставить("ОтчетGenericCoverage", ОписаниеОпцииОтчетGenericCoverage());

	Возврат ЛокализованныеСтроки;

КонецФункции

#КонецОбласти

#Область ЛокализованныеСтроки

Функция ОписаниеОпцииКаталогСОтчетами()
	Возврат НСтр("ru='Каталог с файлами покрытия в форматах XML или JSON';
	|en='Directory covering in XML or JSON'");
КонецФункции

Функция ОписаниеОпцииОтчетGenericCoverage()
	Возврат НСтр("ru='Файл отчета в формате genericCoverage';
	|en='Report file format genericCoverage'");
КонецФункции

#КонецОбласти
