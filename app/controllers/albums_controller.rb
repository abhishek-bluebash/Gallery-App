class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show edit update destroy ]
 
  def index
    @q=Album.ransack(params[:q])
    @albums=@q.result.includes(:tags, :taggings)
  end

    def show
  end

  def new
    @album = current_user.albums.build
  end

  def edit
  end

def create
  @album = current_user.albums.build(album_params)
  respond_to do |format|
    if @album.save
      format.html { redirect_to @album, notice: "Gallery was Created Successfully." }
      format.json { render :show, status: :ok, location: @album }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @album.errors, status: :unprocessable_entity }
    end
  end
end

def update
  respond_to do |format|
  if @album.update(album_params)
    format.html { redirect_to @album, notice: "Gallery was updated Successfully." }
    format.json { render :show, status: :ok, location: @album }
  else
    format.html { render :edit, status: :unprocessable_entity }
    format.json { render json: @album.errors, status: :unprocessable_entity }
  end
end
end  
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: "Album was successfully destroyed." }
      format.json { head :no_content }
   end
  end

    def delete_image_attachment
             @image = ActiveStorage::Blob.find_signed(params[:id])
             @image.attachments.first.purge
             redirect_back(fallback_location: root_path)
    end   
 
  private
     
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title, :description,:delete_image_attachment, :email, :user_id, :published, :all_tags,images: [] )
    end
end





