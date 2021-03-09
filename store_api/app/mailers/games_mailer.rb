class GamesMailer < ApplicationMailer
    def notify_new
        @game = params[:game]
        mail(to: "luis.hilario@bairesdev.com", subject: "Game Mailer")
    end
end
