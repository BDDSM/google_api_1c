﻿
&НаКлиенте
Процедура ИмяФайлаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	ВыбратьФайл();
КонецПроцедуры

&НаКлиенте
Процедура ВыбратьФайл()
	
	Оповещение = Новый ОписаниеОповещения("ПодключитьРасширениеРаботыСФайламиЗавершение", ЭтотОбъект);
	НачатьПодключениеРасширенияРаботыСФайлами(Оповещение);
	
КонецПроцедуры

&НаКлиенте
Процедура ПодключитьРасширениеРаботыСФайламиЗавершение(Подключено, ДополнительныеПараметры) Экспорт
	
	Если Не Подключено Тогда
		ОбщегоНазначенияКлиент.СообщитьПользователю(
			НСтр("ru = 'Для продолжения необходимо установить расширение для работы с 1С:Предприятием.'"));
		Возврат;
	КонецЕсли;
	
	ДиалогОткрытияФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
	ДиалогОткрытияФайла.Фильтр = НСтр("ru = 'Ключ'")+ "(*.p12)|*.p12";
	
	ПараметрыОповещения = Новый Структура;
	
	ОповещениеВыбора = Новый ОписаниеОповещения("ВыбранФайл", ЭтотОбъект, ПараметрыОповещения);
	ДиалогОткрытияФайла.Показать(ОповещениеВыбора);
	
КонецПроцедуры

&НаКлиенте
Процедура ВыбранФайл(ВыбранныеФайлы, ДополнительныеПараметры) Экспорт
	
	Если ВыбранныеФайлы = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ИмяФайла = ВыбранныеФайлы[0];
	
КонецПроцедуры

//--

&НаКлиенте
Процедура ПолучитьXMLКлюч(Команда)
	
	Если ПустаяСтрока(ИмяФайла) Тогда
		
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = "Не заполнен реквизит ИмяФайла, прервано";
		Сообщение.Сообщить();
		
		Возврат;
		
	КонецЕсли;
	
	Файл = Новый ДвоичныеДанные(ИмяФайла);
	Адрес = ПоместитьВоВременноеХранилище(Файл, ЭтаФорма.УникальныйИдентификатор);
	Объект.КлючПодписи_XML = auth_g_Сервер.КонвертироватьКлюч_P12_XML(Адрес);
	
КонецПроцедуры


&НаКлиенте
Процедура ПолучитьТокен(Команда)
	
	Если ПустаяСтрока(Объект.КлючПодписи_XML) Тогда
		
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = "Не заполнен реквизит КлючПодписи_XML, прервано";
		Сообщение.Сообщить();
		
		Возврат;
		
	КонецЕсли;
	
	Токен = auth_g_Сервер.ПолучитьТокен_КлючXML(Объект.Ссылка, ПолучитьПраваДоступа(Объект));
	
КонецПроцедуры

Процедура ПолучитьТокенНаСервере()
КонецПроцедуры

&НаКлиенте
Функция ПолучитьПраваДоступа(СервисныйПользователь)
	
	scope = "";
	
	Для Каждого СтрП Из СервисныйПользователь.ПраваДоступа Цикл
		 scope = scope + СтрП.ПравоДоступа;
	КонецЦикла;

	Возврат scope;
	
КонецФункции


&НаКлиенте
Процедура ИмяФайлаJSONНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	ВыбратьФайлJSON();
КонецПроцедуры

&НаКлиенте
Процедура ВыбратьФайлJSON()
	
	Оповещение = Новый ОписаниеОповещения("ПодключитьРасширениеРаботыСФайламиЗавершениеJSON", ЭтотОбъект);
	НачатьПодключениеРасширенияРаботыСФайлами(Оповещение);
	
КонецПроцедуры

&НаКлиенте
Процедура ПодключитьРасширениеРаботыСФайламиЗавершениеJSON(Подключено, ДополнительныеПараметры) Экспорт
	
	Если Не Подключено Тогда
		ОбщегоНазначенияКлиент.СообщитьПользователю(
			НСтр("ru = 'Для продолжения необходимо установить расширение для работы с 1С:Предприятием.'"));
		Возврат;
	КонецЕсли;
	
	ДиалогОткрытияФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
	ДиалогОткрытияФайла.Фильтр = НСтр("ru = 'Ключ'")+ "(*.json)|*.json";
	
	ПараметрыОповещения = Новый Структура;
	
	ОповещениеВыбора = Новый ОписаниеОповещения("ВыбранФайлJSON", ЭтотОбъект, ПараметрыОповещения);
	ДиалогОткрытияФайла.Показать(ОповещениеВыбора);
	
КонецПроцедуры

&НаКлиенте
Процедура ВыбранФайлJSON(ВыбранныеФайлы, ДополнительныеПараметры) Экспорт
	
	Если ВыбранныеФайлы = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ИмяФайлаJSON = ВыбранныеФайлы[0];
	
КонецПроцедуры

&НаКлиенте
Процедура ПолучитьPEMКлючи(Команда)
	
	Если ПустаяСтрока(ИмяФайлаJSON) Тогда
		
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = "Не заполнен реквизит ИмяФайлаJSON, прервано";
		Сообщение.Сообщить();
		
		Возврат;
		
	КонецЕсли;
	
	ЧтениеТекста = Новый ЧтениеТекста(ИмяФайлаJSON);
	СтрокаДанные = ЧтениеТекста.Прочитать();
	ЧтениеТекста.Закрыть();
	
	СоответствиеДанные = auth_g_РаботаСоСтроками.ИЗ_JSON(СтрокаДанные);
	
	Объект.client_email = СоответствиеДанные.Получить("client_email");
	Объект.private_key_id = СоответствиеДанные.Получить("private_key_id");
	Объект.project_id = СоответствиеДанные.Получить("project_id");
	Объект.private_key = СоответствиеДанные.Получить("private_key");
	
	СоответствиеОтвет = КоннекторHTTP.GetJson(СоответствиеДанные.Получить("client_x509_cert_url"));
	
	Объект.public_key = СоответствиеОтвет.Получить(Объект.private_key_id);
	
КонецПроцедуры

&НаКлиенте
Процедура ПолучитьИнформациюОТокене(Команда)
	
	ПраваДоступаСтрока = "https://www.googleapis.com/auth/cloud-platform";
	Токен = auth_g_Сервер.ПолучитьТокен(Объект.Ссылка, ПраваДоступаСтрока);
	
	ПараметрыЗапроса = Новый Структура();
	ПараметрыЗапроса.Вставить("access_token", Токен);
	
	Ответ = КоннекторHTTP.Get("https://www.googleapis.com/oauth2/v3/tokeninfo", ПараметрыЗапроса);
	
	СтрокаОтвет = КоннекторHTTP.КакТекст(Ответ);
	
	Сообщение = Новый СообщениеПользователю;
	Сообщение.Текст = "" + СтрокаОтвет;
	Сообщение.Сообщить();
	
КонецПроцедуры

&НаКлиенте
Процедура ПолучитьИнформациюОРолях(Команда)
	
	ПраваДоступаСтрока = "https://www.googleapis.com/auth/cloud-platform";
	Токен = auth_g_Сервер.ПолучитьТокен(Объект.Ссылка, ПраваДоступаСтрока);
	
	
	ТокенСледующейСтраницы = "";
	ПерваяСтраница = Истина;
	
	Пока Не ПустаяСтрока(ТокенСледующейСтраницы) ИЛИ ПерваяСтраница Цикл
		
		ПерваяСтраница = Ложь;
		
		ПараметрыЗапроса = Новый Структура();
		ПараметрыЗапроса.Вставить("access_token", Токен);
		Если Не ПустаяСтрока(ТокенСледующейСтраницы) Тогда
			ПараметрыЗапроса.Вставить("pageToken", ТокенСледующейСтраницы);
		КонецЕсли;
		
		Ответ = КоннекторHTTP.Get("https://iam.googleapis.com/v1/roles", ПараметрыЗапроса);
		
		СоответствиеОтвет = КоннекторHTTP.КакJson(Ответ);
		ТокенСледующейСтраницы = СоответствиеОтвет.Получить("nextPageToken");
		
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = "" + КоннекторHTTP.КакТекст(Ответ);
		Сообщение.Сообщить();
		
		Если Ответ.КодСостояния <> 200 Тогда
			Прервать;
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры



