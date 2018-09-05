# set the default locale to English
Rails.application.config.i18n.default_locale = :en
# if a locale isn't found fall back to this default locale
Rails.application.config.i18n.fallbacks = true
# set the possible locales to English and Spanish
Rails.application.config.i18n.available_locales = [:en, :es]
