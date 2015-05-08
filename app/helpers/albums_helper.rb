module AlbumsHelper

  def get_album_url(action, album)
    if action == 'new'
      albums_path
    else
      albums_path(album)
    end
  end
end
