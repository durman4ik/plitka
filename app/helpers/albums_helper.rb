module AlbumsHelper

  def get_album_url(action, album)
    if action == 'new'
      albums_path
    else
      album_path(album)
    end
  end
end
