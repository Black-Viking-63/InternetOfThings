/********************************************************************************************************/
// Locale default pref for K-Meleon - Настройки локализации по умолчанию
/********************************************************************************************************/
pref("general.useragent.locale", "ru");
pref("general.useragent.contentlocale", "ru");

//Отображение страниц+Языки
pref("intl.charset.default", "UTF-8");	//кодировка по умолчанию
pref("intl.charset.detector", "universal_charset_detector");

// Domain completion - автодополнение доменов
//pref("kmeleon.plugins.macros.domComplete0.prefix", "www."); //отключены для освобождения горячего ключа Ctrl+Enter
//pref("kmeleon.plugins.macros.domComplete0.suffix", ".com");
pref("kmeleon.plugins.macros.domComplete1.prefix", "www.");
pref("kmeleon.plugins.macros.domComplete1.suffix", ".net");
pref("kmeleon.plugins.macros.domComplete2.prefix", "www.");
pref("kmeleon.plugins.macros.domComplete2.suffix", ".org");


// K-Meleon Forums Search - поиск на форуме K-Meleon
pref("kmeleon.plugins.macros.search.kmforums", "http://kmeleonbrowser.org/forum/search.php?forum_id=0&match_forum=ALL&match_dates=0&match_type=ALL&search=");


// Default Search Engine URL  (MUST be one out of kmeleon.plugins.macros.search.engine[0..?].url) - поиск по умолчанию
pref("kmeleon.general.searchEngine", "https://www.google.com/search?client=kmeleon&btnI=1&q=");
pref("kmeleon.general.searchEngineName", "Google - I'm feeling lucky");

// Web Search (engine[0..POSITIVE_INFINITY] possible) - настройка списка поисковых систем
// Make sure these engines are defined in search.xml! - данные системы должны присутствовать в файле search.xml! 
// ---------------этот файл может находиться в папке browser\defaults, в каталоге с локалью или в папке профиля
pref("kmeleon.plugins.macros.search.engine0.name", "Yandex");
pref("kmeleon.plugins.macros.search.engine0.url", "https://yandex.ru/search/?clid=2295663&text=");
pref("kmeleon.plugins.macros.search.engine1.name", "Google");
pref("kmeleon.plugins.macros.search.engine1.url", "https://www.google.com/search?client=kmeleon&q=");
pref("kmeleon.plugins.macros.search.engine2.name", "Google Images");
pref("kmeleon.plugins.macros.search.engine2.url", "https://www.google.com/images?client=kmeleon&q=");
pref("kmeleon.plugins.macros.search.engine3.name", "Start Page");
pref("kmeleon.plugins.macros.search.engine3.url", "https://www.startpage.com/do/search?prf=e088ae87a03ba530f4d9d1456d0b4ef4&cat=web&query=");
pref("kmeleon.plugins.macros.search.engine4.name", "Wikipedia Russia");
pref("kmeleon.plugins.macros.search.engine4.url", "https://ru.wikipedia.org/w/index.php?search=");
pref("kmeleon.plugins.macros.search.engine5.name", "K-Meleon Forums Search");
pref("kmeleon.plugins.macros.search.engine5.url", "http://kmeleonbrowser.org/forum/search.php?forum_id=0&match_forum=ALL&match_dates=0&match_type=ALL&search=");
pref("kmeleon.plugins.macros.search.engine6.name", "Yandex Translate");
pref("kmeleon.plugins.macros.search.engine6.url", "https://translate.yandex.ru/?clid=2295663&text=");
