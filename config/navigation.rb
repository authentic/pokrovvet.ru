# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  # navigation.selected_class = 'your_selected_class'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'your_active_leaf_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  navigation.items do |home_primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>. 
    #

    home_primary.item :home, 'Главная', '/show/home'  do |primary|

    primary.item :history, 'История', '/show/history' do |sub_nav|
      sub_nav.item :khutor_vetjutnev, 'Казачий хутор Ветютнев', '/show/khutor_vetjutnev'
      sub_nav.item :church_of_the_protection_of_the_Most_Holy_Theotokos, 'Храм Покрова Пресвятой Богородицы', '/show/church_of_the_protection_of_the_Most_Holy_Theotokos'
      sub_nav.item :church_of_Our_Lady_of_the_Don, 'Храм Донской иконы Божией Матери', '/show/church_of_Our_Lady_of_the_Don'
    end
    primary.item :deanery_frolovskoe, 'Благочиние Фроловского Округа', '/show/deanery_frolovskoe' do |sub_nav|
      sub_nav.item :churches, 'Храмы Фроловского благочиния', '/show/churches'
      sub_nav.item :priesthood, 'Духовенство', '/show/priesthood'
      sub_nav.item :information, 'Сообщения', '/show/information'
      sub_nav.item :orders, 'Распоряжения', '/show/orders'
      sub_nav.item :documents, 'Документы', '/show/documents'

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
      end

      sub_nav.item :orthodox_housewife, 'Православная хозяйка', '/show/orthodox_housewife' do |sub_sub_nav|
        sub_sub_nav.item :recipes, 'Рецепты православной кухни', '/show/recipes'

      end
      sub_nav.item :military_patriotic_club, 'Военно-патриотический клуб', '/show/military_patriotic_club'
      sub_nav.item :collector, 'Коллекционер', '/show/collector'
    end






    #  primary.item :key_1, 'name', url, options

    # Add an item which has a sub navigation (same params, but with block)
    #   primary.item :key_2, 'name', url, options do |sub_nav|
    # Add an item to the sub navigation (same params again)
    #     sub_nav.item :key_2_1, 'name', url, options
    #   end

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.


    # primary.item :key_3, 'Admin', url, :class => 'special', :if => Proc.new { current_user.admin? }
    # primary.item :key_4, 'Account', url, :unless => Proc.new { logged_in? }

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = ''
    #  primary.dom_class = ''

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false

  end

end
 end