/********************************************************************************************************/
// Default pref for k-meleon 
/********************************************************************************************************/


/********************************************************************************************************/
// General

pref("kmeleon.MRU.maxURLs", 16);
pref("kmeleon.MRU.behavior", 2);
pref("kmeleon.general.guest_account", false);
pref("kmeleon.general.offline", false);
pref("kmeleon.general.opengroup", "ID_OPEN_LINK_IN_NEW_TAB|ID_OPEN_LINK_IN_BACKGROUNDTAB");	// Tabs ON
pref("kmeleon.general.openurl", "ID_OPEN_LINK");
//pref("kmeleon.general.searchEngine", "http://www.google.com/search?q=");	// I10n.js
//pref("kmeleon.general.searchEngineName", "Google");				// I10n.js
pref("kmeleon.general.skinsCurrent", "PinstripeTwin");
//pref("kmeleon.display.newWindowOpenAs", 0);  ----- //changed for KM Pro (look in corresponding section below)
//pref("kmeleon.display.newWindowURL", "");   ----- //changed for KM Pro (look in corresponding section below)
pref("kmeleon.general.sourceCommand", "");
pref("kmeleon.general.sourceEnabled", false);

pref("kmeleon.flashblock", false);
pref("kmeleon.adblocking", false);


//pref("browser.startup.autoload_homepage",   true);
pref("browser.startup.homepage", "http://www.yandex.ru/?clid=2295662");
pref("browser.sessionstore.restore_on_demand", true);

/********************************************************************************************************/
// Plugins

pref("kmeleon.plugins.bmpmenu.load", true);
pref("kmeleon.plugins.fullscreen.load", true);
pref("kmeleon.plugins.history.load", false);
pref("kmeleon.plugins.jsbridge.load", true);
pref("kmeleon.plugins.rebarmenu.load", true);
pref("kmeleon.plugins.sessions.load", true);
pref("kmeleon.plugins.searchbarext.load", true);
pref("kmeleon.plugins.toolbars.load", true);
pref("kmeleon.plugins.update.load", true);
pref("kmeleon.plugins.crashrpt.load", true);
pref("kmeleon.plugins.login.load", true);
pref("kmeleon.plugins.spellcheck.load", true);

pref("kmeleon.plugins.bookmarks.load", true);
pref("kmeleon.plugins.bookmarks.chevron", true);
pref("kmeleon.plugins.bookmarks.menuAutoDetect", true);
pref("kmeleon.plugins.bookmarks.openurl", "ID_OPEN_LINK");
pref("kmeleon.plugins.bookmarks.openurlm", "ID_OPEN_LINK_IN_NEW_TAB");
pref("kmeleon.plugins.bookmarks.openurlr", "ID_OPEN_LINK_IN_BACKGROUNDTAB");

pref("kmeleon.plugins.favorites.load", false);
pref("kmeleon.plugins.favorites.menuAutoDetect", true);
pref("kmeleon.plugins.favorites.openurl", "ID_OPEN_LINK");

pref("kmeleon.plugins.hotlist.load", false);
pref("kmeleon.plugins.hotlist.menuAutoDetect", true);
pref("kmeleon.plugins.hotlist.openurl", "ID_OPEN_LINK");

pref("kmeleon.plugins.gestures.load", false);
pref("kmeleon.plugins.gestures.down", "ID_OPEN_LINK_IN_BACKGROUNDTAB");
pref("kmeleon.plugins.gestures.downleft", "ID_TAB_LAST");
pref("kmeleon.plugins.gestures.downright", "ID_CLOSE_TAB");
pref("kmeleon.plugins.gestures.left", "ID_NAV_BACK");
pref("kmeleon.plugins.gestures.right", "ID_NAV_FORWARD");
pref("kmeleon.plugins.gestures.up", "ID_OPEN_LINK_IN_NEW_TAB");
pref("kmeleon.plugins.gestures.upleft", "ID_TAB_PREV");
pref("kmeleon.plugins.gestures.upright", "ID_TAB_NEXT");

pref("kmeleon.plugins.layers.load", false);

pref("kmeleon.plugins.macros.load", true);
pref("kmeleon.plugins.macros.search.locked", true);
//pref("kmeleon.plugins.macros.selected.openurl", "ID_OPEN_LINK"); ----- //changed for KM Pro (look in corresponding section below)	

pref("kmeleon.plugins.privacy.load", true);
pref("kmeleon.plugins.privacy.clearCache", 0);
pref("kmeleon.plugins.privacy.clearCookies", 0);
pref("kmeleon.plugins.privacy.clearHistory", 0);
pref("kmeleon.plugins.privacy.clearMRU", 0);
pref("kmeleon.plugins.privacy.clearSignOn", 0);

/********************************************************************************************************/
// Appearance

//pref("kmeleon.display.title", "K-Meleon");	----- //changed for KM Pro (look in corresponding section below)
//pref("kmeleon.display.NewWindowHasUrlFocus", false);   ----- //changed for KM Pro (look in corresponding section below)
pref("kmeleon.display.backgroundImage", "");
pref("kmeleon.display.backgroundImageEnabled", false);
//pref("kmeleon.display.maximized", false);  ---- //changed for KM Pro (defined by skin.js)
pref("kmeleon.display.disableResize", false);
pref("kmeleon.display.accelInMenus", true);
//pref("kmeleon.display.hideTitleBar", false);   ---- //changed for KM Pro (defined by skin.js)
pref("kmeleon.favicons.show", true);
pref("browser.chrome.site_icons", true);
//pref("browser.chrome.favicons", false);  ----- //changed for KM Pro (look in corresponding section below)

//pref("kmeleon.urlbar.dropdown_lines", 10); // To not set by default

/********************************************************************************************************/
// Print

pref("print.show_print_progress", false);
pref("print.use_native_print_dialog", true);


/********************************************************************************************************/
// Privacy

pref("signon.rememberSignons", true);
pref("capability.policy.restrictedpopups.Window.open", "allAccess");
pref("capability.policy.restrictedpopups.sites", "");
pref("dom.disable_open_during_load", true);
pref("kmeleon.favicons.cached", true);

 //Determines how the browser should handle  cookies.
//0: Enable all cookies 1: Allow cookies from originating server only 2: Disable all cookies 3: from visited sites only
pref("network.cookie.cookieBehavior", 3); ----- //changed for KM Pro (look in corresponding section below)


/********************************************************************************************************/
// Download

pref("kmeleon.download.saveType", 0);
pref("kmeleon.download.saveDir", "");
pref("kmeleon.download.saveUseTitle", true);

pref("browser.download.useDownloadDir", false);
pref("kmeleon.download.useSaveDir", false);
pref("kmeleon.download.askOpenSave", true);
pref("kmeleon.download.SaveUnkownContent", true);
pref("kmeleon.download.showMinimizedDialog", false);
//pref("kmeleon.download.closeDownloadDialog", false);  ----- //changed for KM Pro (look in corresponding section below)
pref("browser.download.dir", "");
pref("browser.download.lastDir", "");
pref("kmeleon.download.flashWhenCompleted", false);


/********************************************************************************************************/
// For the tab version only

pref("browser.tabs.autoHide", false);		// classic behavior
//pref("browser.tabs.warnOnClose", true);  ----- //changed for KM Pro (look in corresponding section below)
pref("kmeleon.tabs.OnDoubleClick", 3);		// classic behavior
pref("kmeleon.tabs.OnMiddleClick", 3);		// classic behavior
pref("kmeleon.tabs.OnRightClick", 2);
pref("kmeleon.tabs.onCloseLast", 1);
//pref("kmeleon.tabs.onCloseOption", 1);  ----- //changed for KM Pro (look in corresponding section below)
pref("kmeleon.tabs.onOpenOption", 0);
pref("kmeleon.tabs.useLoadingTitle", false);
pref("kmeleon.notab", false);
pref("kmeleon.tabs.title", "");
pref("kmeleon.tabs.minWidth", 6);
pref("kmeleon.tabs.maxWidth", 60);
pref("kmeleon.tabs.style", 2);
pref("kmeleon.tabs.fixedBar", false); 
pref("kmeleon.tabs.position", "band");


/********************************************************************************************************/

pref("browser.cache.memory.capacity", -1);
//pref("browser.cache.disk.capacity", 131072);
pref("browser.cache.disk.max_entry_size", 51200);
pref("browser.cache.disk.smart_size.enabled", false);
pref("browser.cache.disk.smart_size.first_run", false);

pref("browser.urlbar.autoFill", false);
pref("browser.urlbar.autocomplete.enabled", true);

pref("keyword.enabled", true);
pref("kmeleon.find.matchCase", false);
pref("kmeleon.find.searchBackwards", false);
pref("kmeleon.find.wrapAround", true);

pref("general.smoothScroll", false);
pref("general.autoScroll", true);

//pref("browser.chrome.image_icons.max_size", 1024);

// external link handling in tabbed browsers. values from nsIBrowserDOMWindow.
// 0=default window, 1=current window/tab, 2=new window, 3=new tab in most recent window
pref("browser.link.open_external", 2); // open externally-launched links in a new window

// handle links targeting new windows
//2 (default): In a new window 3: In a new tab 1 (or anything else): In the current window
//pref("browser.link.open_newwindow", 2);  ----- //changed for KM Pro (look in corresponding section below)

// 0: no restrictions - divert everything
// 1: don't divert window.open at all
// 2: don't divert window.open with features
//pref("browser.link.open_newwindow.restriction", 2);  ----- //changed for KM Pro (look in corresponding section below)

// Show XUL error pages instead of alerts for errors
pref("browser.xul.error_pages.enabled", true);

// Flashblock
pref("flashblock.html5video.blocked", false);
pref("flashblock.silverlight.blocked", false);
pref("flashblock.whitelist.includeTarget", false);
pref("flashblock.blockLocal", false);
pref("services.sync.prefs.sync.flashblock.whitelist", false);

// History
pref("browser.tabs.loadBookmarksInBackground", false);
pref("browser.tabs.warnOnOpen", true);
pref("browser.tabs.maxOpenBeforeWarn", 15);
pref('places.history.enabled', true);

// Others
pref('app.update.enabled', false); 
pref('extensions.console2.max-errors', 1000);
pref("browser.zoom.full", true);
pref("full-screen-api.enabled", true);

// Prevent window to steal the focus when loading
pref("dom.disable_window_flip", true);

pref("dom.ipc.plugins.enabled", false); //disable execution of plugins in separate process
pref("dom.ipc.plugins.enabled.npswf32.dll", true);  //enable separate process for flash (plugin-container.exe)
pref("plugins.load_appdir_plugins", true);
pref("accessibility.typeaheadfind.flashBar", 1);

pref("general.useragent.compatMode.firefox", true);
pref("layout.spellcheckDefault", 0);

// for performance !
pref("consoleservice.enabled", false);

// extensions
pref("extensions.update.url", "https://versioncheck.addons.mozilla.org/update/VersionCheck.php?reqVersion=%REQ_VERSION%&id=%ITEM_ID%&version=%ITEM_VERSION%&maxAppVersion=%ITEM_MAXAPPVERSION%&status=%ITEM_STATUS%&appID=%APP_ID%&appVersion=%APP_VERSION%&appOS=%APP_OS%&appABI=%APP_ABI%&locale=%APP_LOCALE%&currentAppVersion=%CURRENT_APP_VERSION%&updateType=%UPDATE_TYPE%&compatMode=%COMPATIBILITY_MODE%");
pref("extensions.getAddons.cache.enabled", true);
pref("xpinstall.enabled", true);
pref("xpinstall.whitelist.add", "addons.mozilla.org");
pref("extensions.blocklist.enabled", false);
pref("extensions.logging.enabled", false);
pref("extensions.strictCompatibility", false);
//pref("plugins.click_to_play", true);

// preferences
pref("browser.preferences.instantApply", false);
pref("browser.translation.ui.show", false);
pref("app.support.baseURL", "https://support.mozilla.org/1/firefox/%VERSION%/%OS%/%LOCALE%/");
pref("browser.search.showOneOffButtons", true);
pref("pdfjs.disabled", true);
pref("browser.eme.ui.enabled", true);

// Others
pref("security.csp.speccompliant", true);
pref("places.favicons.optimizeToDimension", 32);
//----------------------------------------------------------------------------------------------------------------------
//--------------------------------------K-Meleon Pro 76 added by rodocop -----------------------------------------------
//----------------------------------------------------------------------------------------------------------------------

/*?????????????? ??????+???????????? ????????????????????????*/
//pref("general.useragent.locale, "ru");	//?????????????? ?????????????????? - ?????????????????? ?? i10n.js
pref("kmeleon.display.title", "K-Meleon 76 Pro");	//???????????????? ?? ?????????????????? ????????
pref("kmeleon.display.hideTitleBar", false);	//???? ???????????????? ?????????????????? ????????
pref("kmeleon.tabs.maxWidth", 35);	//???????????? ?????????? ????????????????????????
pref("kmeleon.display.toolbars_line", true);	//?????????????????????? ???????????????????????? ???????????????? (?????????????????????? ?? 75)
pref("browser.chrome.favicons", true);	//?????????????????? ?????? ?????????????????? ????????????????

//????????????????
pref("browser.link.open_newwindow", 3);	//???????????????? ???????? ??? ?????? ???????????? ????????
pref("browser.link.open_external", 3); 	//???????????????? ???????? ??? ?????????????? ???????????? ?? ??????
pref("browser.link.open_newwindow.restriction", 0); // 0 - ???????????????????????? ??????, ?????? ?????????????????? browser.link.open_newwindow; 1 - ?????????????????? ?????????????? window.open ?? ????????; 2 - ?????????????????? ?? ???????? ???????????? ???? ????????, ?????? ?????????????? ?????????????? ???????????????????? ?????????????????? (????????????, ????????????, ?? ??.??.)
pref("kmeleon.plugins.macros.selected.openurl", "ID_OPEN_LINK_IN_NEW_TAB");	//???????????????????? ?????????? ?? ?????????? ????????
pref("kmeleon.display.newWindowOpenAs", 3);	//?????? ???????????????? ?????????? ?????????? ???????????????????? ??????????:
pref("kmeleon.display.newWindowURL", "about:home");	//about:home ?????????????????? ????????????????
pref("kmeleon.display.urlbar_fontsize", "1");

//next 3 prefs added by an updated docinfo.kmm for K-Meleon 75 Pro - this fixes a long time deficiency in KM 74-75
//pref("kmeleon.plugins.macros.docinfo.forceTab.images", true);	//?????????????????????? ???????????????? ?? ?????????? ?????????????? (?????? ?? 75)
//pref("kmeleon.plugins.macros.docinfo.forceTab.links", true);	//???????????? ???????????? ???????????????? ?? ?????????? ?????????????? (=//=)
//pref("kmeleon.plugins.macros.docinfo.forceTab.linkedImages", true);	//?????????????????????? ???? ?????????????? ???????????????? ?? ?????????? ?????????????? (=//=)

//??????????????
pref("kmeleon.tabs.onCloseOption", 2);	//?????? ???????????????? ???????? ?????????? ???? ?????????????? ???????????????? ??????????????
pref("browser.tabs.warnOnClose", false);	//???? ?????????????????????????? ?????? ???????????????? ???? ?? ?????????? ?????? 1 ??????????
pref("kmeleon.display.NewWindowHasUrlFocus", true);	//?? ?????????? ???????????????? ?????????? ??? ?? ???????????????? ????????????

//?????????????????? ????????????
pref("kmeleon.download.closeDownloadDialog", true);	//?????????????????? ???????????? ???????????????? ???? ????????????????????
pref("browser.download.folderList", 2);	//???????????????????????? ?????????????????????????? ?????????????????????????? ?????????? ?????? ????????????????
pref("browser.download.lastDir.savePerSite", true);	//?????????????? ?????????? ???????????????????? ?????? ?????????????? ?????????? ????????????????
pref("security.dialog_enable_delay", 500);	//?????????????????? ???????????????? ?????? ???????????????? ???????????????????? ???????????? ?? ?????????????????????? ?????????????? XPI. ???? ?????????????????? = 1000 (????). ------?????????? ?? KM76

//??????????
//pref("kmeleon.general.searchEngineName", "Google - I'm feeling lucky");	//?????????? ???? ?????????????????? - defined in i10n.js
pref("kmeleon.plugins.searchbarext.open", 2);	//?????????????????? ???????????? ???????????? ???? ???????????? ?? ?????????? ???????????????? ??????????????
pref("kmeleon.plugins.searchbarext.pastego", true);	//???????????? ?????????????????????????? ?????? ?????????????????????? ?? ???????????? ????????????

//??????
//pref("browser.cache.disk.max_entry_size", XXX);	//?????? ???? ???????? ???????????? ???????????????? ???? ??????/8
pref("browser.cache.disk.enable", false);	//?????????????????? ???????????????? ??????
pref("browser.cache.memory.max_entry_size", -1);	//?????? ?? ???????????? ???????????????? ???????????? ??????????????
pref("browser.offline-apps.notify", false);	//???? ???????????????????? ?? ?????????????? ??????-???????????????????? ?????????????????? ????????????-????????
pref("offline-apps.allow_by_default", false);  //?????????????????? ??????-?????????????????????? ?????????????????? ????????????-????????
pref("browser.cache.offline.capacity", 0);  //?????????????? ????????????-??????
pref("browser.cache.offline.enable", false);  //?????????????????? ????????????-?????? 

//JavaScript
pref("dom.disable_window_move_resize", true);	//???????????? JS ???????????????? ?????????????? ?? ?????????????????? ????????
pref("dom.disable_window_status_change", true);	//???????????? JS ???????????????? ??????????????????
pref("dom.event.contextmenu.enabled", false);	//???????????? JS ?????????????????? ?????????????????????? ????????
//pref("dom.event.clipboardevents.enabled", true);	//???????????? JS ?????????????????? ??????-???? ?? ???????????????? ?????? ??????????????????????
pref("dom.max_script_run_time", 15);	//?????????????? ???????????? ?????????????? (?????????? ?????????? ????????????????????????????)
pref("dom.enable_performance", false);	//???? ???????????????? ???????????? ?????????? ???????????????? ???????????????? (??????????????????????) ------?????????? ?? KM76
pref("dom.network.enabled", false); 	//???? ???????????????? ???????????? ?????? ?????????? ???????? - wifi, LAN ?? ??.??. (??????????????????????) ------?????????? ?? KM76
pref("dom.battery.enabled", false);	//???? ???????????????? ???????????? ?????????????????? ?????????????? (??????????????????????) ------?????????? ?? KM76

//????????????
pref("kmeleon.plugins.sessions.openStart", "Previous Session"); //?????????????????? ???????????????????? ???????????? ?????? ???????????? ????????????????
pref("kmeleon.plugins.sessions.autoload", true); //?????????????????? ???????????????????? ???????????? ?????? ???????????? ????????????????
pref("kmeleon.plugins.sessions.ask_autoload", false); //???? ???????????????????? ?? ???????????? ???????????? ?????? ????????????????
pref("kmeleon.plugins.sessions.maxUndo", 5);	//???????????????? ?????????????????? ?????????? ???????????? ???????????????? ??????????????

//???????????????????????? ??? DoNotTrack, TLS, media
//pref("privacy.donottrackheader.enabled", true);	//???? ?????????????????????? ????????
pref("media.enforce_same_site_origin", true);	//?????????????????? html5-???????????????????????? ???????????? ?? ???????????????? ??????????
pref("security.ssl3.dhe_rsa_camellia_128_sha", false);	//???????????????????? ???????????????????????? ????????????
pref("security.ssl3.dhe_rsa_camellia_256_sha", false);	//???????????????????? ???????????????????????? ????????????
pref("security.ssl3.ecdhe_ecdsa_rc4_128_sha", false);	//???????????????????? ???????????????????????? ????????????
pref("security.ssl3.ecdhe_rsa_rc4_128_sha", false);	//???????????????????? ???????????????????????? ????????????
pref("security.ssl3.rsa_camellia_128_sha", false);	//???????????????????? ???????????????????????? ????????????
pref("security.ssl3.rsa_camellia_256_sha", false);	//???????????????????? ???????????????????????? ????????????
pref("security.ssl3.rsa_rc4_128_md5", false);	//???????????????????? ???????????????????????? ????????????
pref("security.ssl3.rsa_rc4_128_sha", false);	//???????????????????? ???????????????????????? ????????????
pref("security.tls.version.min", 1);	//???????????????? ?? ?????????????????????? ???? ????????, ??????: '2' ?????? TLS 1.1, '1' ?????? TLS 1.0)
pref("dom.keyboardevent.code.enabled", false); 	//?????? ?? ?????? 2 ???????????? ?????????????????????????? ???????????????????? ------?????????? ?? KM76
pref("dom.beforeAfterKeyboardEvent.enabled", false); 
pref("dom.keyboardevent.dispatch_during_composition", false);
pref("network.jar.block-remote-files", true); //???????????? ???????????????? ?????????????????? JAR-???????????? ?? ?????????? ???????????????????? ------?????????? ?? KM76
pref("network.IDN_show_punycode", true); //???????????????? "??????????????" ?? ???????????? ???????????? ???? ?????????????????? ????????????-???????????????????? ???????????? ------?????????? ?? KM76

//?????????????????????????????? ???????????? ???????????????? ???????????????????? ???????????????? 	------------------------?????????? ?? KM76
pref("beacon.enabled", false);
pref("browser.download.manager.addToRecentDocs", false);
pref("browser.download.hide_plugins_without_extensions", false);
pref("network.http.spdy.enabled", false);
pref("network.http.spdy.enabled.v3-1", false);
pref("network.http.spdy.enabled.deps", false);
pref("network.http.spdy.enabled.http2", false);

//FAYT  (?????????????? ?????????? ???? ???????? ???????????? ???? ????????????????)
pref("accessibility.typeaheadfind.linksonly", false);	//?????????????? ?????????? ???? ???????????? ?? ??????????????
pref("accessibility.typeaheadfind.soundURL", "default");	//?????????? ???????????????? ???????? ?????? ???????????? ???????????? ???? ??????????
pref("ui.textSelectBackgroundAttention", "##cc0033");	//???????? ?????????????????? ????????????, ???????????????????? FAYT 

//???????????? ??????????
pref("ui.click_hold_context_menus", true);	//????????????????-???????? ???? ?????????????????? ??????
pref("ui.click_hold_context_menus.delay", 1200);	//???????????????? ?????????????????? ????????????????-???????? ???? ??????
pref("layout.word_select.eat_space_to_next_word", false);	//?????? ?????????????????? ???????? ?????????????? ?????? ???? ?????????????????????? ???????????? 			?????????? ??????????
pref("ui.use_activity_cursor", true);	//???????? ???????????????? ????????????????, ???????????? ?????????????? ??????????????????

//?????????????????????? ?????????????? ???????????????????? ?? ?????????????????? ?????????????? (???????????????? ?? ????????????????????????)
pref("content.notify.ontimer", true);	//???????????????????? ?????? ???????????? ???????????? ???????????? content.notify
pref("content.notify.interval", 120000);	//???????????????? ?????????? ?????????????????????????? ???????????????? ???? ???????? ????????????????
pref("content.notify.backoffcount", 3);	//???????????????????????? ?????????? ??????????????????????, ???? ???????????? ??????????????????
pref("content.interrupt.parsing", true);	//?????????????????? ?????????????? ???????????????? ?????? ???????????????????????? UI
pref("content.max.tokenizing.time", 360000);	//???????????????????????? ?????????? ?????????????????????????????? UI ?????? ????????????????, ????
pref("content.switch.threshold", 300000);	//?????????????? ???????????????? ?? ?????????????????? ?????????????? ?????????????????????? ????????????????; ?????????? ?????????????????????? ?????????????????????? ???????? ?????? ???????????????????? ?????? ?????????????? ????????????????
pref("network.http.pipelining", true);	//???????????????? ?????????????????????? ?????????????? (???? ???????????? ?????????????? ????????????)
pref("network.http.pipelining.maxrequests", 8);	//???????????????? ???????????????? ?? ??????????????????
pref("network.http.proxy.pipelining", true);	//???????????????? ?????????????????????? ?????????????? ?? ????????????
pref("network.http.pipelining.firstrequest", true);	//
pref("network.dns.disableIPv6", true);	//?????????????????? IPv6
pref("nglayout.initialpaint.delay", 100);	//?????????????????? ???????????????? ?????????? ?????????????? ?????????????????? 
pref("network.http.max-connections", 60);	//???????????????? ???????????????????? ?? ??????
pref("network.http.max-connections-per-server", 8);	//???????????????? ???????????????????? ?? ?????????? ????????????????
pref("network.http.max-persistent-connections-per-proxy", 4);	//???????????????? ???????????????????????????? ???????????????????? ?? ????????????
pref("network.http.max-persistent-connections-per-server", 2);	//???????????????? ???????????????????????????? ???????????????????? ?? ??????-????????????????
pref("network.http.keep-alive.timeout", 115);	//?????????? ?????????? ????????????????????
pref("network.http.request.max-start-delay", 5);	//?????????? ?? ??????, ?????????? ???????????????? ?????????? ???????? ?????????????????? ?????????? ?????????????????????????? ????????????????????, ???????????????????????? ?????????? network.http.max-persistent-connections-per-proxy ??-per-server
pref("content.maxtextrun", 4095);	//?????????? ?????????????????????????? ?????????????????????????????? ?????????? ???????????? ?? ????????????
pref("network.ftp.idleConnectionTimeout", 150);	//?????????? ???????????????????????? FTP-???????????????????? ?? ??????, ?????? ????????????
pref("network.prefetch-next", false);	//?????????????????? ???????????????????????? ???? ?????????????? (????????????????????????)	
pref("network.protocol-handler.external.ms-windows-store", false); //?????????????????? ?????????????????? ???????????? ???? ?????????????? Windows ------?????????? ?? KM76
pref("network.http.redirection-limit", 10); //?????????????? ?????????? ??????????????????????????????. ???? ?????????????? ???????????? 10!!! ???? ?????????????????? = 20. ------?????????? ?? KM76

//?????????????????????? ???????????????? ?? ?????????????????????? ????????????
pref("plugin.expose_full_path", true);	//???????????????????? ???????????? ???????? ?? np-????????????????
pref("browser.sessionhistory.max_total_viewers", 1);	//???????????????????? ???? ?????????? ?????????? ?????????? ???????????????????? ????????????????
pref("browser.sessionhistory.max_entries", 20);	//19 ?????????????? ?? ?????????????? ?????????????? ?????? ???????????????? ???????????????? ??????????
pref("config.trim_on_minimize", false);	//???? ???????????????????? RAM ?? ???????? ???????????????? ?????? ???????????????????????? ???? 
pref("memory.free_dirty_pages", true);	//???????????????????????????? ??????.?????????????? ?? ???????????? ???????????????? ????????????

//????????????
pref("security.warn_entering_weak", false);	//???? ?????????????????????????? ?? ???????????? ????????????????????????
pref("security.warn_viewing_mixed", false);	//???? ?????????????????????????? ?? ?????????????????? ???????????????????? ??????????????????????
pref("browser.xul.error_pages.expert_bad_cert", true);	//???????????????? ???????????? ?????? ?????????????? ???????????????? ???????????????? ????????????????????????
pref("kmeleon.install_firefox_extension", true);	//?????????????????? ???????????????????? Firefox ???????????????? ('false' - ?????? ?????????????????? xpi-????????????????????, ???????????????????? ???????????????????? ?????? ????)
pref("general.warnOnAboutConfig", false);	//???? ???????????????????? ???????????????????????????? ?? about:config
pref("browser.offline-apps.notify", true); //?????????????????? ??????????, ?????????? ???????? ?????????? ?????????????????? ?????????????????? ???????????? ------?????????? ?? KM76

//HTML5 and WebGL	-------------------------------------------------?????????? ?? KM76
pref("media.autoplay.enabled", false); //?????????????????? ?????????????????????????????????????? html5-?????????? (???????????? ??????????????????)
pref("media.block-play-until-visible", true); //?????????????????? ?????????????????????????????? html5-??????????, ???????? ?????? ???? ???????????? ??????????
pref("webgl.disabled", true); 	//?????????????????? webGL (+ ?????????????????? 3 ????????????)
pref("webgl.min_capability_mode", true);
pref("webgl.disable-extensions", true);
pref("webgl.disable-fail-if-major-performance-caveat", true);

//?????????????? ?????????????? ???????????????????????? ?????????????????? 	-------------------------------------------------?????????? ?? KM76
pref("layers.acceleration.disabled", true);
pref("gfx.direct2d.disabled", true);
pref("layers.offmainthreadcomposition.enabled", false); //???????????? ???????????????? ?????????????????? ?????????????? ???????? ?????? ???????????????? ?????????? ??????????????
	
//??????????????
pref("extensions.blocklist.enabled", false)	//?????????????????? ???????????????????? ???????????????? ?? ???????????????????? ???? ???????????? Firefox (?????????? ???????????????????? Flash ???? ????????????????????)
//pref("plugin.scan.Acrobat", "99999"); //?????????????????????? ???????????? ???????????????? (???? ???????????????????? Foxit ?????? SumatraPDF)
      //----?????????????????? ???????????????????????????? ?????????????? (?????????? ????)
pref("extensions.pfbackup.files", "sessions.json,accel.cfg,menus.cfg,Note4me.txt,prefs.js,cert8.db,key3.db,sessions.json.bak,signons.sqlite,mimeTypes.rdf,cookies.sqlite,content-prefs.sqlite");
pref("extensions.pfbackup.interval", 24);
pref("extensions.pfbackup.onstartup", true);