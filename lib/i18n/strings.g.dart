
/*
 * Generated file. Do not edit.
 *
 * Locales: 7
 * Strings: 217 (31.0 per locale)
 *
 * Built on 2022-09-03 at 05:21 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	ar, // 'ar'
	de, // 'de'
	ja, // 'ja'
	nl, // 'nl'
	no, // 'no'
	sv, // 'sv'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		// force rebuild if TranslationProvider is used
		_translationProviderKey.currentState?.setLocale(_currLocale);

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsAr _translationsAr = _StringsAr.build();
late _StringsDe _translationsDe = _StringsDe.build();
late _StringsJa _translationsJa = _StringsJa.build();
late _StringsNl _translationsNl = _StringsNl.build();
late _StringsNo _translationsNo = _StringsNo.build();
late _StringsSv _translationsSv = _StringsSv.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.ar: return _translationsAr;
			case AppLocale.de: return _translationsDe;
			case AppLocale.ja: return _translationsJa;
			case AppLocale.nl: return _translationsNl;
			case AppLocale.no: return _translationsNo;
			case AppLocale.sv: return _translationsSv;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.ar: return _StringsAr.build();
			case AppLocale.de: return _StringsDe.build();
			case AppLocale.ja: return _StringsJa.build();
			case AppLocale.nl: return _StringsNl.build();
			case AppLocale.no: return _StringsNo.build();
			case AppLocale.sv: return _StringsSv.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.ar: return 'ar';
			case AppLocale.de: return 'de';
			case AppLocale.ja: return 'ja';
			case AppLocale.nl: return 'nl';
			case AppLocale.no: return 'no';
			case AppLocale.sv: return 'sv';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.ar: return const Locale.fromSubtags(languageCode: 'ar');
			case AppLocale.de: return const Locale.fromSubtags(languageCode: 'de');
			case AppLocale.ja: return const Locale.fromSubtags(languageCode: 'ja');
			case AppLocale.nl: return const Locale.fromSubtags(languageCode: 'nl');
			case AppLocale.no: return const Locale.fromSubtags(languageCode: 'no');
			case AppLocale.sv: return const Locale.fromSubtags(languageCode: 'sv');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'ar': return AppLocale.ar;
			case 'de': return AppLocale.de;
			case 'ja': return AppLocale.ja;
			case 'nl': return AppLocale.nl;
			case 'no': return AppLocale.no;
			case 'sv': return AppLocale.sv;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String get language => 'English';
	String get languageEn => 'English';
	String get languageJa => '英語';
	String get reactionTime => 'Reaction Time';
	String get speedTest => 'Speed Test';
	String get startTest => 'Start test';
	String get noDataYet => 'No data yet';
	String fastest({required Object count}) => 'Fastest: ${count}s';
	String highest({required Object count}) => 'Highest: ${count}';
	late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
	late final _StringsFullscreenEn fullscreen = _StringsFullscreenEn._(_root);
	late final _StringsNinebuttonsEn ninebuttons = _StringsNinebuttonsEn._(_root);
	late final _StringsMashbuttonEn mashbutton = _StringsMashbuttonEn._(_root);
	late final _StringsSpeedEn speed = _StringsSpeedEn._(_root);
}

// Path: settings
class _StringsSettingsEn {
	_StringsSettingsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get settings => 'Settings';
	String get clearAllData => 'Clear All Data';
	String get clearedAllData => 'Cleared all data';
}

// Path: fullscreen
class _StringsFullscreenEn {
	_StringsFullscreenEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get fullscreen => 'Fullscreen';
	String get tap => 'Tap!';
	String get tapToStart => 'Tap to start';
	String get tapWhenRed => 'Wait for red';
	String score({required Object count}) => 'Time: ${count}s\nTap to back';
	String get mistake => 'Too fast!\nTap to restart';
}

// Path: ninebuttons
class _StringsNinebuttonsEn {
	_StringsNinebuttonsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get ninebuttons => '9 Buttons';
	String result({required Object count}) => 'Time: ${count}s';
	String get tapred => 'Tap Red!';
	String get failure => 'Failure!';
}

// Path: mashbutton
class _StringsMashbuttonEn {
	_StringsMashbuttonEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get mashbutton => 'Mash Button';
	String get mashthebutton => 'Mash the red button';
	String score({required Object count}) => 'Score: ${count}';
}

// Path: speed
class _StringsSpeedEn {
	_StringsSpeedEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get speed => 'Speed';
	String get superFast => 'Super Fast';
	String get fast => 'Fast';
	String get normal => 'Normal';
	String get slow => 'Slow';
	String get areyoukiddingme => 'Are you kidding me?';
}

// Path: <root>
class _StringsAr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsAr.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsAr _root = this; // ignore: unused_field

	// Translations
	@override String get language => 'عربي';
	@override String get languageEn => 'Arabic';
	@override String get languageJa => 'アラビア語';
	@override String get reactionTime => 'وقت رد الفعل';
	@override String get speedTest => 'اختبار السرعة';
	@override String get startTest => 'ابدأ الاختبار';
	@override String get noDataYet => 'لا توجد بيانات حتى الآن';
	@override String fastest({required Object count}) => 'الأسرع: ${count} ثانية';
	@override String highest({required Object count}) => 'الحد الأقصى: ${count}';
	@override late final _StringsSettingsAr settings = _StringsSettingsAr._(_root);
	@override late final _StringsFullscreenAr fullscreen = _StringsFullscreenAr._(_root);
	@override late final _StringsNinebuttonsAr ninebuttons = _StringsNinebuttonsAr._(_root);
	@override late final _StringsMashbuttonAr mashbutton = _StringsMashbuttonAr._(_root);
	@override late final _StringsSpeedAr speed = _StringsSpeedAr._(_root);
}

// Path: settings
class _StringsSettingsAr implements _StringsSettingsEn {
	_StringsSettingsAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get settings => 'إعدادات';
	@override String get clearAllData => 'مسح كافة البيانات';
	@override String get clearedAllData => 'محو جميع البيانات';
}

// Path: fullscreen
class _StringsFullscreenAr implements _StringsFullscreenEn {
	_StringsFullscreenAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get fullscreen => 'شاشة كاملة';
	@override String get tap => 'يدفع!';
	@override String get tapToStart => 'انقر للبدء';
	@override String get tapWhenRed => 'انتظر الأحمر';
	@override String score({required Object count}) => 'الوقت: ${count} ثوانٍ\nانقر للرجوع';
	@override String get mistake => 'سريع جدا!';
}

// Path: ninebuttons
class _StringsNinebuttonsAr implements _StringsNinebuttonsEn {
	_StringsNinebuttonsAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get ninebuttons => '9 أزرار';
	@override String result({required Object count}) => 'الوقت: ${count} ثواني';
	@override String get tapred => 'اضغط على الأحمر!';
	@override String get failure => 'بالفشل!';
}

// Path: mashbutton
class _StringsMashbuttonAr implements _StringsMashbuttonEn {
	_StringsMashbuttonAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get mashbutton => 'اهرسي الزر';
	@override String get mashthebutton => 'Mash the red button';
	@override String score({required Object count}) => 'Score: ${count}';
}

// Path: speed
class _StringsSpeedAr implements _StringsSpeedEn {
	_StringsSpeedAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get speed => 'سرعة';
	@override String get superFast => 'سريع جدا';
	@override String get fast => 'سريع';
	@override String get normal => 'طبيعي';
	@override String get slow => 'بطيء';
	@override String get areyoukiddingme => 'هل تمزح معي؟';
}

// Path: <root>
class _StringsDe implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsDe.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsDe _root = this; // ignore: unused_field

	// Translations
	@override String get language => 'Deutsch';
	@override String get languageEn => 'German';
	@override String get languageJa => 'ドイツ語';
	@override String get reactionTime => 'Reaction Time';
	@override String get speedTest => 'Speed Test';
	@override String get startTest => 'Start test';
	@override String get noDataYet => 'No data yet';
	@override String fastest({required Object count}) => 'Fastest: ${count}s';
	@override String highest({required Object count}) => 'Highest: ${count}';
	@override late final _StringsSettingsDe settings = _StringsSettingsDe._(_root);
	@override late final _StringsFullscreenDe fullscreen = _StringsFullscreenDe._(_root);
	@override late final _StringsNinebuttonsDe ninebuttons = _StringsNinebuttonsDe._(_root);
	@override late final _StringsMashbuttonDe mashbutton = _StringsMashbuttonDe._(_root);
	@override late final _StringsSpeedDe speed = _StringsSpeedDe._(_root);
}

// Path: settings
class _StringsSettingsDe implements _StringsSettingsEn {
	_StringsSettingsDe._(this._root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Settings';
	@override String get clearAllData => 'Clear All Data';
	@override String get clearedAllData => 'Cleared all data';
}

// Path: fullscreen
class _StringsFullscreenDe implements _StringsFullscreenEn {
	_StringsFullscreenDe._(this._root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get fullscreen => 'Fullscreen';
	@override String get tap => 'Tap!';
	@override String get tapToStart => 'Tap to start';
	@override String get tapWhenRed => 'Wait for red';
	@override String score({required Object count}) => 'Time: ${count}s\nTap to back';
	@override String get mistake => 'Too fast!\nTap to restart';
}

// Path: ninebuttons
class _StringsNinebuttonsDe implements _StringsNinebuttonsEn {
	_StringsNinebuttonsDe._(this._root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get ninebuttons => '9 Buttons';
	@override String result({required Object count}) => 'Time: ${count}s';
	@override String get tapred => 'Tap Red!';
	@override String get failure => 'Failure!';
}

// Path: mashbutton
class _StringsMashbuttonDe implements _StringsMashbuttonEn {
	_StringsMashbuttonDe._(this._root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get mashbutton => 'Mash Button';
	@override String get mashthebutton => 'Mash the red button';
	@override String score({required Object count}) => 'Score: ${count}';
}

// Path: speed
class _StringsSpeedDe implements _StringsSpeedEn {
	_StringsSpeedDe._(this._root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get speed => 'Speed';
	@override String get superFast => 'Super Fast';
	@override String get fast => 'Fast';
	@override String get normal => 'Normal';
	@override String get slow => 'Slow';
	@override String get areyoukiddingme => 'Are you kidding me?';
}

// Path: <root>
class _StringsJa implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsJa.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsJa _root = this; // ignore: unused_field

	// Translations
	@override String get language => '日本語';
	@override String get languageEn => 'Japanese';
	@override String get languageJa => '日本語';
	@override String get reactionTime => '反応速度テスト';
	@override String get speedTest => '反応速度テスト';
	@override String get startTest => 'テストスタート';
	@override String get noDataYet => '記録なし';
	@override String fastest({required Object count}) => '最速: ${count}秒';
	@override String highest({required Object count}) => '最高: ${count}';
	@override late final _StringsSettingsJa settings = _StringsSettingsJa._(_root);
	@override late final _StringsFullscreenJa fullscreen = _StringsFullscreenJa._(_root);
	@override late final _StringsNinebuttonsJa ninebuttons = _StringsNinebuttonsJa._(_root);
	@override late final _StringsMashbuttonJa mashbutton = _StringsMashbuttonJa._(_root);
	@override late final _StringsSpeedJa speed = _StringsSpeedJa._(_root);
}

// Path: settings
class _StringsSettingsJa implements _StringsSettingsEn {
	_StringsSettingsJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get settings => '設定';
	@override String get clearAllData => 'データを消去';
	@override String get clearedAllData => 'データを消去しました。';
}

// Path: fullscreen
class _StringsFullscreenJa implements _StringsFullscreenEn {
	_StringsFullscreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get fullscreen => 'フルスクリーン';
	@override String get tap => 'タップ!';
	@override String get tapToStart => 'タップしてスタート';
	@override String get tapWhenRed => '赤くなったらタップ!';
	@override String score({required Object count}) => '記録: ${count}秒\nタップで戻る';
	@override String get mistake => '早い!\nタップでリスタート';
}

// Path: ninebuttons
class _StringsNinebuttonsJa implements _StringsNinebuttonsEn {
	_StringsNinebuttonsJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get ninebuttons => '９つのボタン';
	@override String result({required Object count}) => '時間: ${count}秒';
	@override String get tapred => '赤をタップ！';
	@override String get failure => '失敗！';
}

// Path: mashbutton
class _StringsMashbuttonJa implements _StringsMashbuttonEn {
	_StringsMashbuttonJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get mashbutton => 'ボタン連打';
	@override String get mashthebutton => 'ボタンを連打しろ!';
	@override String score({required Object count}) => 'スコア: ${count}回';
}

// Path: speed
class _StringsSpeedJa implements _StringsSpeedEn {
	_StringsSpeedJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get speed => 'スピード';
	@override String get superFast => 'とても速い';
	@override String get fast => '速い';
	@override String get normal => '普通';
	@override String get slow => '遅い';
	@override String get areyoukiddingme => 'マジで言ってる?';
}

// Path: <root>
class _StringsNl implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsNl.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsNl _root = this; // ignore: unused_field

	// Translations
	@override String get language => 'Nederlands';
	@override String get languageEn => 'Dutch';
	@override String get languageJa => 'オランダ語';
	@override String get reactionTime => 'Reactietijd';
	@override String get speedTest => 'Snelheidstest';
	@override String get startTest => 'Start test';
	@override String get noDataYet => 'Nog geen gegevens';
	@override String fastest({required Object count}) => 'Snelste: ${count}s';
	@override String highest({required Object count}) => 'Hoogste: ${count}';
	@override late final _StringsSettingsNl settings = _StringsSettingsNl._(_root);
	@override late final _StringsFullscreenNl fullscreen = _StringsFullscreenNl._(_root);
	@override late final _StringsNinebuttonsNl ninebuttons = _StringsNinebuttonsNl._(_root);
	@override late final _StringsMashbuttonNl mashbutton = _StringsMashbuttonNl._(_root);
	@override late final _StringsSpeedNl speed = _StringsSpeedNl._(_root);
}

// Path: settings
class _StringsSettingsNl implements _StringsSettingsEn {
	_StringsSettingsNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Instellingen';
	@override String get clearAllData => 'Wis alle gegevens';
	@override String get clearedAllData => 'Alle gegevens gewist.';
}

// Path: fullscreen
class _StringsFullscreenNl implements _StringsFullscreenEn {
	_StringsFullscreenNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get fullscreen => 'Volledig scherm';
	@override String get tap => 'Tik!';
	@override String get tapToStart => 'Tik om te beginnen';
	@override String get tapWhenRed => 'Wacht op rood';
	@override String score({required Object count}) => 'Tijd: ${count}s\nTik op terug';
	@override String get mistake => 'Te snel!\nTik om opnieuw te starten';
}

// Path: ninebuttons
class _StringsNinebuttonsNl implements _StringsNinebuttonsEn {
	_StringsNinebuttonsNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get ninebuttons => '9 Knoppen';
	@override String result({required Object count}) => 'Tijd: ${count}s';
	@override String get tapred => 'Tik rood!';
	@override String get failure => 'Mislukking!';
}

// Path: mashbutton
class _StringsMashbuttonNl implements _StringsMashbuttonEn {
	_StringsMashbuttonNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get mashbutton => 'Mash knop';
	@override String get mashthebutton => 'Druk op de rode knop.';
	@override String score({required Object count}) => 'Score: ${count}';
}

// Path: speed
class _StringsSpeedNl implements _StringsSpeedEn {
	_StringsSpeedNl._(this._root);

	@override final _StringsNl _root; // ignore: unused_field

	// Translations
	@override String get speed => 'Snelheid';
	@override String get superFast => 'Super Snel';
	@override String get fast => 'Snel';
	@override String get normal => 'Normaal';
	@override String get slow => 'Langzaam';
	@override String get areyoukiddingme => 'Neem je me in de maling?';
}

// Path: <root>
class _StringsNo implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsNo.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsNo _root = this; // ignore: unused_field

	// Translations
	@override String get language => 'Noors';
	@override String get languageEn => 'Norwegian';
	@override String get languageJa => 'ノルウェー語';
	@override String get reactionTime => 'Reaksjonstid';
	@override String get speedTest => 'Fartstest';
	@override String get startTest => 'Start testen';
	@override String get noDataYet => 'Ingen data ennå';
	@override String fastest({required Object count}) => 'Raskest: ${count}s';
	@override String highest({required Object count}) => 'Høyest: ${count}';
	@override late final _StringsSettingsNo settings = _StringsSettingsNo._(_root);
	@override late final _StringsFullscreenNo fullscreen = _StringsFullscreenNo._(_root);
	@override late final _StringsNinebuttonsNo ninebuttons = _StringsNinebuttonsNo._(_root);
	@override late final _StringsMashbuttonNo mashbutton = _StringsMashbuttonNo._(_root);
	@override late final _StringsSpeedNo speed = _StringsSpeedNo._(_root);
}

// Path: settings
class _StringsSettingsNo implements _StringsSettingsEn {
	_StringsSettingsNo._(this._root);

	@override final _StringsNo _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Innstillinger';
	@override String get clearAllData => 'Fjern alle data';
	@override String get clearedAllData => 'Fjernet alle data';
}

// Path: fullscreen
class _StringsFullscreenNo implements _StringsFullscreenEn {
	_StringsFullscreenNo._(this._root);

	@override final _StringsNo _root; // ignore: unused_field

	// Translations
	@override String get fullscreen => 'Full skjerm';
	@override String get tap => 'Trykk!';
	@override String get tapToStart => 'Trykk for å starte';
	@override String get tapWhenRed => 'Vent på rødt';
	@override String score({required Object count}) => 'Tid: ${count}s\nTrykk for å gå tilbake';
	@override String get mistake => 'For fort!\nTrykk for å starte på nytt';
}

// Path: ninebuttons
class _StringsNinebuttonsNo implements _StringsNinebuttonsEn {
	_StringsNinebuttonsNo._(this._root);

	@override final _StringsNo _root; // ignore: unused_field

	// Translations
	@override String get ninebuttons => '9 knapper';
	@override String result({required Object count}) => 'Tid: ${count}s';
	@override String get tapred => 'Trykk rødt!';
	@override String get failure => 'Mislykket!';
}

// Path: mashbutton
class _StringsMashbuttonNo implements _StringsMashbuttonEn {
	_StringsMashbuttonNo._(this._root);

	@override final _StringsNo _root; // ignore: unused_field

	// Translations
	@override String get mashbutton => 'Mash-knapp';
	@override String get mashthebutton => 'Mos den røde knappen';
	@override String score({required Object count}) => 'Score: ${count}';
}

// Path: speed
class _StringsSpeedNo implements _StringsSpeedEn {
	_StringsSpeedNo._(this._root);

	@override final _StringsNo _root; // ignore: unused_field

	// Translations
	@override String get speed => 'Hastighet';
	@override String get superFast => 'Superrask';
	@override String get fast => 'Rask';
	@override String get normal => 'Vanlig';
	@override String get slow => 'Langsom';
	@override String get areyoukiddingme => 'Tuller du med meg?';
}

// Path: <root>
class _StringsSv implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsSv.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsSv _root = this; // ignore: unused_field

	// Translations
	@override String get language => 'Swedish';
	@override String get languageEn => 'svenska';
	@override String get languageJa => 'スウェーデン語';
	@override String get reactionTime => 'Reaktionstid';
	@override String get speedTest => 'Hastighetstest';
	@override String get startTest => 'Starta testet';
	@override String get noDataYet => 'Inga uppgifter ännu';
	@override String fastest({required Object count}) => 'Snabbast: ${count}s';
	@override String highest({required Object count}) => 'Högsta: ${count}';
	@override late final _StringsSettingsSv settings = _StringsSettingsSv._(_root);
	@override late final _StringsFullscreenSv fullscreen = _StringsFullscreenSv._(_root);
	@override late final _StringsNinebuttonsSv ninebuttons = _StringsNinebuttonsSv._(_root);
	@override late final _StringsMashbuttonSv mashbutton = _StringsMashbuttonSv._(_root);
	@override late final _StringsSpeedSv speed = _StringsSpeedSv._(_root);
}

// Path: settings
class _StringsSettingsSv implements _StringsSettingsEn {
	_StringsSettingsSv._(this._root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Inställningar';
	@override String get clearAllData => 'Rensa alla data';
	@override String get clearedAllData => 'Rensade alla uppgifter.';
}

// Path: fullscreen
class _StringsFullscreenSv implements _StringsFullscreenEn {
	_StringsFullscreenSv._(this._root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get fullscreen => 'Fullskärm';
	@override String get tap => 'Tryck!';
	@override String get tapToStart => 'Tryck på för att starta';
	@override String get tapWhenRed => 'Vänta på rött';
	@override String score({required Object count}) => 'Tid: ${count}s\nTryck på för att backa';
	@override String get mistake => 'För snabbt!\nTryck på för att starta om';
}

// Path: ninebuttons
class _StringsNinebuttonsSv implements _StringsNinebuttonsEn {
	_StringsNinebuttonsSv._(this._root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get ninebuttons => '9 knappar';
	@override String result({required Object count}) => 'Tid: ${count}s';
	@override String get tapred => 'Tryck på Red!';
	@override String get failure => 'Misslyckande!';
}

// Path: mashbutton
class _StringsMashbuttonSv implements _StringsMashbuttonEn {
	_StringsMashbuttonSv._(this._root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get mashbutton => 'Mash-knapp';
	@override String get mashthebutton => 'Tryck på den röda knappen';
	@override String score({required Object count}) => 'Poäng: ${count}';
}

// Path: speed
class _StringsSpeedSv implements _StringsSpeedEn {
	_StringsSpeedSv._(this._root);

	@override final _StringsSv _root; // ignore: unused_field

	// Translations
	@override String get speed => 'Hastighet';
	@override String get superFast => 'Supersnabbt';
	@override String get fast => 'Snabbt';
	@override String get normal => 'Normal';
	@override String get slow => 'Långsam';
	@override String get areyoukiddingme => 'Skojar du med mig?';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'language': 'English',
			'languageEn': 'English',
			'languageJa': '英語',
			'reactionTime': 'Reaction Time',
			'speedTest': 'Speed Test',
			'startTest': 'Start test',
			'noDataYet': 'No data yet',
			'fastest': ({required Object count}) => 'Fastest: ${count}s',
			'highest': ({required Object count}) => 'Highest: ${count}',
			'settings.settings': 'Settings',
			'settings.clearAllData': 'Clear All Data',
			'settings.clearedAllData': 'Cleared all data',
			'fullscreen.fullscreen': 'Fullscreen',
			'fullscreen.tap': 'Tap!',
			'fullscreen.tapToStart': 'Tap to start',
			'fullscreen.tapWhenRed': 'Wait for red',
			'fullscreen.score': ({required Object count}) => 'Time: ${count}s\nTap to back',
			'fullscreen.mistake': 'Too fast!\nTap to restart',
			'ninebuttons.ninebuttons': '9 Buttons',
			'ninebuttons.result': ({required Object count}) => 'Time: ${count}s',
			'ninebuttons.tapred': 'Tap Red!',
			'ninebuttons.failure': 'Failure!',
			'mashbutton.mashbutton': 'Mash Button',
			'mashbutton.mashthebutton': 'Mash the red button',
			'mashbutton.score': ({required Object count}) => 'Score: ${count}',
			'speed.speed': 'Speed',
			'speed.superFast': 'Super Fast',
			'speed.fast': 'Fast',
			'speed.normal': 'Normal',
			'speed.slow': 'Slow',
			'speed.areyoukiddingme': 'Are you kidding me?',
		};
	}
}

extension on _StringsAr {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'language': 'عربي',
			'languageEn': 'Arabic',
			'languageJa': 'アラビア語',
			'reactionTime': 'وقت رد الفعل',
			'speedTest': 'اختبار السرعة',
			'startTest': 'ابدأ الاختبار',
			'noDataYet': 'لا توجد بيانات حتى الآن',
			'fastest': ({required Object count}) => 'الأسرع: ${count} ثانية',
			'highest': ({required Object count}) => 'الحد الأقصى: ${count}',
			'settings.settings': 'إعدادات',
			'settings.clearAllData': 'مسح كافة البيانات',
			'settings.clearedAllData': 'محو جميع البيانات',
			'fullscreen.fullscreen': 'شاشة كاملة',
			'fullscreen.tap': 'يدفع!',
			'fullscreen.tapToStart': 'انقر للبدء',
			'fullscreen.tapWhenRed': 'انتظر الأحمر',
			'fullscreen.score': ({required Object count}) => 'الوقت: ${count} ثوانٍ\nانقر للرجوع',
			'fullscreen.mistake': 'سريع جدا!',
			'ninebuttons.ninebuttons': '9 أزرار',
			'ninebuttons.result': ({required Object count}) => 'الوقت: ${count} ثواني',
			'ninebuttons.tapred': 'اضغط على الأحمر!',
			'ninebuttons.failure': 'بالفشل!',
			'mashbutton.mashbutton': 'اهرسي الزر',
			'mashbutton.mashthebutton': 'Mash the red button',
			'mashbutton.score': ({required Object count}) => 'Score: ${count}',
			'speed.speed': 'سرعة',
			'speed.superFast': 'سريع جدا',
			'speed.fast': 'سريع',
			'speed.normal': 'طبيعي',
			'speed.slow': 'بطيء',
			'speed.areyoukiddingme': 'هل تمزح معي؟',
		};
	}
}

extension on _StringsDe {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'language': 'Deutsch',
			'languageEn': 'German',
			'languageJa': 'ドイツ語',
			'reactionTime': 'Reaction Time',
			'speedTest': 'Speed Test',
			'startTest': 'Start test',
			'noDataYet': 'No data yet',
			'fastest': ({required Object count}) => 'Fastest: ${count}s',
			'highest': ({required Object count}) => 'Highest: ${count}',
			'settings.settings': 'Settings',
			'settings.clearAllData': 'Clear All Data',
			'settings.clearedAllData': 'Cleared all data',
			'fullscreen.fullscreen': 'Fullscreen',
			'fullscreen.tap': 'Tap!',
			'fullscreen.tapToStart': 'Tap to start',
			'fullscreen.tapWhenRed': 'Wait for red',
			'fullscreen.score': ({required Object count}) => 'Time: ${count}s\nTap to back',
			'fullscreen.mistake': 'Too fast!\nTap to restart',
			'ninebuttons.ninebuttons': '9 Buttons',
			'ninebuttons.result': ({required Object count}) => 'Time: ${count}s',
			'ninebuttons.tapred': 'Tap Red!',
			'ninebuttons.failure': 'Failure!',
			'mashbutton.mashbutton': 'Mash Button',
			'mashbutton.mashthebutton': 'Mash the red button',
			'mashbutton.score': ({required Object count}) => 'Score: ${count}',
			'speed.speed': 'Speed',
			'speed.superFast': 'Super Fast',
			'speed.fast': 'Fast',
			'speed.normal': 'Normal',
			'speed.slow': 'Slow',
			'speed.areyoukiddingme': 'Are you kidding me?',
		};
	}
}

extension on _StringsJa {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'language': '日本語',
			'languageEn': 'Japanese',
			'languageJa': '日本語',
			'reactionTime': '反応速度テスト',
			'speedTest': '反応速度テスト',
			'startTest': 'テストスタート',
			'noDataYet': '記録なし',
			'fastest': ({required Object count}) => '最速: ${count}秒',
			'highest': ({required Object count}) => '最高: ${count}',
			'settings.settings': '設定',
			'settings.clearAllData': 'データを消去',
			'settings.clearedAllData': 'データを消去しました。',
			'fullscreen.fullscreen': 'フルスクリーン',
			'fullscreen.tap': 'タップ!',
			'fullscreen.tapToStart': 'タップしてスタート',
			'fullscreen.tapWhenRed': '赤くなったらタップ!',
			'fullscreen.score': ({required Object count}) => '記録: ${count}秒\nタップで戻る',
			'fullscreen.mistake': '早い!\nタップでリスタート',
			'ninebuttons.ninebuttons': '９つのボタン',
			'ninebuttons.result': ({required Object count}) => '時間: ${count}秒',
			'ninebuttons.tapred': '赤をタップ！',
			'ninebuttons.failure': '失敗！',
			'mashbutton.mashbutton': 'ボタン連打',
			'mashbutton.mashthebutton': 'ボタンを連打しろ!',
			'mashbutton.score': ({required Object count}) => 'スコア: ${count}回',
			'speed.speed': 'スピード',
			'speed.superFast': 'とても速い',
			'speed.fast': '速い',
			'speed.normal': '普通',
			'speed.slow': '遅い',
			'speed.areyoukiddingme': 'マジで言ってる?',
		};
	}
}

extension on _StringsNl {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'language': 'Nederlands',
			'languageEn': 'Dutch',
			'languageJa': 'オランダ語',
			'reactionTime': 'Reactietijd',
			'speedTest': 'Snelheidstest',
			'startTest': 'Start test',
			'noDataYet': 'Nog geen gegevens',
			'fastest': ({required Object count}) => 'Snelste: ${count}s',
			'highest': ({required Object count}) => 'Hoogste: ${count}',
			'settings.settings': 'Instellingen',
			'settings.clearAllData': 'Wis alle gegevens',
			'settings.clearedAllData': 'Alle gegevens gewist.',
			'fullscreen.fullscreen': 'Volledig scherm',
			'fullscreen.tap': 'Tik!',
			'fullscreen.tapToStart': 'Tik om te beginnen',
			'fullscreen.tapWhenRed': 'Wacht op rood',
			'fullscreen.score': ({required Object count}) => 'Tijd: ${count}s\nTik op terug',
			'fullscreen.mistake': 'Te snel!\nTik om opnieuw te starten',
			'ninebuttons.ninebuttons': '9 Knoppen',
			'ninebuttons.result': ({required Object count}) => 'Tijd: ${count}s',
			'ninebuttons.tapred': 'Tik rood!',
			'ninebuttons.failure': 'Mislukking!',
			'mashbutton.mashbutton': 'Mash knop',
			'mashbutton.mashthebutton': 'Druk op de rode knop.',
			'mashbutton.score': ({required Object count}) => 'Score: ${count}',
			'speed.speed': 'Snelheid',
			'speed.superFast': 'Super Snel',
			'speed.fast': 'Snel',
			'speed.normal': 'Normaal',
			'speed.slow': 'Langzaam',
			'speed.areyoukiddingme': 'Neem je me in de maling?',
		};
	}
}

extension on _StringsNo {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'language': 'Noors',
			'languageEn': 'Norwegian',
			'languageJa': 'ノルウェー語',
			'reactionTime': 'Reaksjonstid',
			'speedTest': 'Fartstest',
			'startTest': 'Start testen',
			'noDataYet': 'Ingen data ennå',
			'fastest': ({required Object count}) => 'Raskest: ${count}s',
			'highest': ({required Object count}) => 'Høyest: ${count}',
			'settings.settings': 'Innstillinger',
			'settings.clearAllData': 'Fjern alle data',
			'settings.clearedAllData': 'Fjernet alle data',
			'fullscreen.fullscreen': 'Full skjerm',
			'fullscreen.tap': 'Trykk!',
			'fullscreen.tapToStart': 'Trykk for å starte',
			'fullscreen.tapWhenRed': 'Vent på rødt',
			'fullscreen.score': ({required Object count}) => 'Tid: ${count}s\nTrykk for å gå tilbake',
			'fullscreen.mistake': 'For fort!\nTrykk for å starte på nytt',
			'ninebuttons.ninebuttons': '9 knapper',
			'ninebuttons.result': ({required Object count}) => 'Tid: ${count}s',
			'ninebuttons.tapred': 'Trykk rødt!',
			'ninebuttons.failure': 'Mislykket!',
			'mashbutton.mashbutton': 'Mash-knapp',
			'mashbutton.mashthebutton': 'Mos den røde knappen',
			'mashbutton.score': ({required Object count}) => 'Score: ${count}',
			'speed.speed': 'Hastighet',
			'speed.superFast': 'Superrask',
			'speed.fast': 'Rask',
			'speed.normal': 'Vanlig',
			'speed.slow': 'Langsom',
			'speed.areyoukiddingme': 'Tuller du med meg?',
		};
	}
}

extension on _StringsSv {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'language': 'Swedish',
			'languageEn': 'svenska',
			'languageJa': 'スウェーデン語',
			'reactionTime': 'Reaktionstid',
			'speedTest': 'Hastighetstest',
			'startTest': 'Starta testet',
			'noDataYet': 'Inga uppgifter ännu',
			'fastest': ({required Object count}) => 'Snabbast: ${count}s',
			'highest': ({required Object count}) => 'Högsta: ${count}',
			'settings.settings': 'Inställningar',
			'settings.clearAllData': 'Rensa alla data',
			'settings.clearedAllData': 'Rensade alla uppgifter.',
			'fullscreen.fullscreen': 'Fullskärm',
			'fullscreen.tap': 'Tryck!',
			'fullscreen.tapToStart': 'Tryck på för att starta',
			'fullscreen.tapWhenRed': 'Vänta på rött',
			'fullscreen.score': ({required Object count}) => 'Tid: ${count}s\nTryck på för att backa',
			'fullscreen.mistake': 'För snabbt!\nTryck på för att starta om',
			'ninebuttons.ninebuttons': '9 knappar',
			'ninebuttons.result': ({required Object count}) => 'Tid: ${count}s',
			'ninebuttons.tapred': 'Tryck på Red!',
			'ninebuttons.failure': 'Misslyckande!',
			'mashbutton.mashbutton': 'Mash-knapp',
			'mashbutton.mashthebutton': 'Tryck på den röda knappen',
			'mashbutton.score': ({required Object count}) => 'Poäng: ${count}',
			'speed.speed': 'Hastighet',
			'speed.superFast': 'Supersnabbt',
			'speed.fast': 'Snabbt',
			'speed.normal': 'Normal',
			'speed.slow': 'Långsam',
			'speed.areyoukiddingme': 'Skojar du med mig?',
		};
	}
}
