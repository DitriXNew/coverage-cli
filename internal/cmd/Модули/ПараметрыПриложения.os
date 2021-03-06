#Использовать logos

Перем ЛогПриложения;

#Область ПрограммныйИнтерфейс

// Возвращает значение лога приложения
//
// Возвращаемое значение:
//   Логирование - Лог приложения
//
Функция Лог() Экспорт

	Если ЛогПриложения = Неопределено Тогда
		ЛогПриложения = Логирование.ПолучитьЛог(ИмяЛогаПриложения());
	КонецЕсли;

	Возврат ЛогПриложения;

КонецФункции

// Устанавливает уровень лога в режим отладки
//
Процедура ВключитьРежимОтладки() Экспорт
	Лог().УстановитьУровень(УровниЛога.Отладка);
КонецПроцедуры 

// Возвращает каталог приложения
//
//  Возвращаемое значение:
//   Строка - Корневой каталог текущего приложения
//
Функция КаталогПриложения() Экспорт

	ПутьККаталогу = ОбъединитьПути(СтартовыйСценарий().Каталог, "..");
	ФайлКаталога = Новый Файл(ПутьККаталогу);
	Возврат ФайлКаталога.ПолноеИмя;

КонецФункции

// Возвращает текущую версию приложения
//
//  Возвращаемое значение:
//   Строка - Текущая версия приложения
//
Функция ВерсияПриложения() Экспорт
	Возврат "0.8.0";
КонецФункции

// Возвращает имя приложения
//
//  Возвращаемое значение:
//   Строка - Имя приложения
//
Функция ИмяПриложения() Экспорт
	Возврат "coverage-cli";
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ИмяЛогаПриложения()
	Возврат СтрШаблон("oscript.app.%1", ИмяПриложения());
КонецФункции

#КонецОбласти
