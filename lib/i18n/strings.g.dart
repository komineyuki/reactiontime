
/*
 * Generated file. Do not edit.
 *
 * Locales: 3
 * Strings: 81 (27.0 per locale)
 *
 * Built on 2022-08-28 at 11:58 UTC
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
	ja, // 'ja'
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
late _StringsJa _translationsJa = _StringsJa.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.ar: return _translationsAr;
			case AppLocale.ja: return _translationsJa;
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
			case AppLocale.ja: return _StringsJa.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.ar: return 'ar';
			case AppLocale.ja: return 'ja';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.ar: return const Locale.fromSubtags(languageCode: 'ar');
			case AppLocale.ja: return const Locale.fromSubtags(languageCode: 'ja');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'ar': return AppLocale.ar;
			case 'ja': return AppLocale.ja;
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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'reactionTime': 'Reaction Time',
			'speedTest': 'Speed Test',
			'startTest': 'Start test',
			'noDataYet': 'No data yet',
			'fastest': ({required Object count}) => 'Fastest: ${count}s',
			'highest': ({required Object count}) => 'Highest: ${count}',
			'settings.settings': 'Settings',
			'settings.clearAllData': 'Clear All Data',
			'settings.clearedAllData': 'Cleared all data',
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
			'reactionTime': 'وقت رد الفعل',
			'speedTest': 'اختبار السرعة',
			'startTest': 'ابدأ الاختبار',
			'noDataYet': 'لا توجد بيانات حتى الآن',
			'fastest': ({required Object count}) => 'الأسرع: ${count} ثانية',
			'highest': ({required Object count}) => 'الحد الأقصى: ${count}',
			'settings.settings': 'إعدادات',
			'settings.clearAllData': 'مسح كافة البيانات',
			'settings.clearedAllData': 'محو جميع البيانات',
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

extension on _StringsJa {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'reactionTime': '反応速度テスト',
			'speedTest': '反応速度テスト',
			'startTest': 'テストスタート',
			'noDataYet': '記録なし',
			'fastest': ({required Object count}) => '最速: ${count}秒',
			'highest': ({required Object count}) => '最高: ${count}',
			'settings.settings': '設定',
			'settings.clearAllData': 'データを消去',
			'settings.clearedAllData': 'データを消去しました。',
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
