# Preview all emails at http://localhost:3000/rails/mailers/album_mailer
class AlbumMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/album_mailer/new_album
  def destroy_album
    album = Album.last
    AlbumMailer.destroy_album(album)
  end
  def new_album
    album = Album.last
    AlbumMailer.new_album(album)
  end
end
