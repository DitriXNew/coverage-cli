
#Использовать fs

#Область КомандаПриложения

Процедура ОписаниеКоманды(Команда) Экспорт

	Команда.Опция("o output", "", "XML файл с результатами покрытия")
		.ТСтрока()
		.Обязательный();

	Команда.Опция("w workspace", "", "Каталог проекта")
		.ТСтрока();

	Команда.Опция("s sources", "", "Каталог исходных текстов конфигурации")
		.ТСтрока();

КонецПроцедуры

Процедура ВыполнитьКоманду(Знач Команда) Экспорт

	КаталогПроекта = Команда.ЗначениеОпции("workspace");
	КаталогИсходниковКонфигурации = Команда.ЗначениеОпции("sources");
	ФайлВывода = Команда.ЗначениеОпции("output");
	
	КаталогПриложения = ПараметрыПриложения.КаталогПриложения();

	ПутьКлассовBSL = ОбъединитьПути(КаталогПриложения, "vendor", "BSLLSP", "*");
	КонфигурацияАнализа = ОбъединитьПути(КаталогПриложения, "configs", "bsl-lsp-coverage.json");

	ПараметрыПриложенияJava = УтилитыПриложения.НовыйПараметрыПриложенияJava();
	ПараметрыПриложенияJava.ОсновнойКласс = "com.github._1c_syntax.bsl.languageserver.BSLLSPLauncher";
	ПараметрыПриложенияJava.ПутиКлассов.Добавить(ПутьКлассовBSL);

	КаталогРезультатов = ПолучитьИмяВременногоФайла();
	ФС.ОбеспечитьКаталог(КаталогРезультатов);

	Команда = УтилитыПриложения.КомандаПриложениеJava(ПараметрыПриложенияJava);
	Команда.ПоказыватьВыводНемедленно(Истина);
	Команда.ДобавитьПараметр("--analyze");
	Команда.ДобавитьПараметр("--reporter genericCoverage");
	Команда.ДобавитьПараметр(СтрШаблон("--srcDir ""%1""", КаталогИсходниковКонфигурации));
	Команда.ДобавитьПараметр(СтрШаблон("--outputDir ""%1""", КаталогРезультатов));
	Команда.ДобавитьПараметр(СтрШаблон("--configuration ""%1""", КонфигурацияАнализа));
	Команда.ДобавитьПараметр("--silent");
	Команда.Исполнить();

	ФайлПокрытияXML = ОбъединитьПути(КаталогРезультатов, "genericCoverage.xml");

	КопироватьФайл(ФайлПокрытияXML, ФайлВывода);
	
	УдалитьФайлы(КаталогРезультатов);

КонецПроцедуры

#КонецОбласти
