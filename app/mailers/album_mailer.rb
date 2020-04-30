class AlbumMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.album_mailer.new_album.subject
  #
  def new_album(album)
     mail to: album.user.email, subject: 'New Post Added'
  end

def destroy_album(album)
    mail to: album.user.email,
         subject: "Album has been deleted"
  end
end
