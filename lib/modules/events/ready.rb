module Bot
  module DiscordEvents
    # This event is processed each time the bot succesfully connects to discord.
    module Ready
      extend Discordrb::EventContainer
      ready do |event|
        BOT.idle
        Bot.remove_captains
        DOUBLOONSCAPE.update_captains_status(Bot.get_members_status)
        Bot.reset_captain
        DOUBLOONSCAPE.start
        Bot.send_chat "Anchors Aweigh! DoubloonScape has begun!"
        puts "Bot connected."
        Bot.update_topic(DOUBLOONSCAPE.status)
        #Bot.game_loop
      end
    end
  end
end
