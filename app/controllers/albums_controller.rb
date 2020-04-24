class AlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index ]
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index


      if current_user.admin?
          @search= Album.search(params[:q])
             @albums = @search.result.page(params[:page])
      else

       @search = current_user.albums.search(params[:q])
       @albums = @search.result.page(params[:page])
      end
  end

  def search
    @albums=Album.where("title LIKE ?","%" + params[:q] + "%")
  end

  def show

   end

  def recent
  @albums=Album.all
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create

    @album = Album.new(album_params)
    @album.user = current_user
    respond_to do |format|

      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }

      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }

      end

    end

  end
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

   @album.destroy
       respond_to do |format|
        format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
        format.json { head :no_content }
       end
  end

  def delete_upload

    attachment = ActiveStorage::Attachment.find(params[:id])

    attachment.purge

    redirect_back(fallback_location: albums_url)

  end

  def tagged
    if params[:tag].present?
      @albums = Album.tagged_with(params[:tag])
    else
      @ablums = Album.all
    end
  end

  private
      def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title, :discription, :tag_list, images: [])
    end
end
