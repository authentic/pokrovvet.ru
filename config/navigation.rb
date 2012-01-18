# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |home_primary|
    home_primary.item :home, 'Главная', '/' do |primary|
      primary.item :history, 'История', '/show/history' do |sub_nav|
        sub_nav.item :khutor_vetjutnev, 'Казачий хутор Ветютнев', '/show/khutor_vetjutnev'
        sub_nav.item :church_of_the_protection_of_the_Most_Holy_Theotokos, 'Храм Покрова Пресвятой Богородицы', '/show/church_of_the_protection_of_the_Most_Holy_Theotokos'
        sub_nav.item :church_of_Our_Lady_of_the_Don, 'Храм Донской иконы Божией Матери', '/show/church_of_Our_Lady_of_the_Don'
        sub_nav.item :military_patriotic_club, 'Православно-патриотический клуб', '/show/military_patriotic_club'
      end
      primary.item :our_parish, 'Наш приход', '/show/our_parish' do |sub_nav|
        sub_nav.item :news, 'События прихода', '/show/news'
        sub_nav.item :library, 'Библиотека при храме', '/show/library' do |sub_sub_nav|
          sub_sub_nav.item :books, 'Книги', '/show/books'
          sub_sub_nav.item :magazines, 'Журналы', '/show/magazines'
        end

        sub_nav.item :calendars, 'Календари', '/show/calendars' do |sub_sub_nav|
          sub_sub_nav.item :orthodox_calendar, 'Православный календарь', '/show/orthodox_calendar'
          sub_sub_nav.item :church_calendar, 'Календарь богослужений и мероприятий храма', '/show/church_calendar'
        end
        sub_nav.item :pilgrimage, 'Паломничества', '/show/pilgrimage'
        sub_nav.item :ask_questions, 'Вопрос Настоятелю', '/show/ask_questions'
        sub_nav.item :commemoration, 'Поминовение', '/show/commemoration'

      end
      primary.item :our_projects, 'Наши проекты', '/show/our_projects' do |sub_nav|

        sub_nav.item :publishing, 'Издательства', '/show/publishing' do |sub_sub_nav|
          sub_sub_nav.item :newspaper_choose_life, 'Газета "Избери жизнь"', '/show/newspaper_choose_life'
          sub_sub_nav.item :newspaper_news_deanery_frolovskoe, 'Газета "Новости Фроловского благочиния"', '/show/newspaper_news_deanery_frolovskoe'
          sub_sub_nav.item :archives, 'Архив', '/show/archives'
        end

        sub_nav.item :orthodox_housewife, 'Православная хозяйка', '/show/orthodox_housewife' do |sub_sub_nav|
          sub_sub_nav.item :recipes, 'Рецепты православной кухни', '/show/recipes'

        end

        sub_nav.item :collector, 'Коллекционер', '/show/collector'
      end
      primary.item :deanery_frolovskoe, 'Фроловское благочиние', '/show/deanery_frolovskoe' do |sub_nav|
        sub_nav.item :churches, 'Храмы Фроловского благочиния', '/show/churches'
        sub_nav.item :priesthood, 'Духовенство', '/show/priesthood'
        sub_nav.item :information, 'Сообщения', '/show/information'
        sub_nav.item :orders, 'Распоряжения', '/show/orders'
        sub_nav.item :documents, 'Документы', '/show/documents'
      end

      primary.dom_id = 'top_navigation'
      #  primary.dom_class = ''
      # You can turn off auto highlighting for a specific level
      # primary.auto_highlight = false
    end
  end
end