class ArtbooksController < ApplicationController
  def create
    @artbook = current_user.artbooks.build(artbook_params)
    if @artbook.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @artbooks = current_user.artbooks.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @artbook.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def artbook_params
    params.require(:artbook).permit(:content, :image, :image_cache)
  end
  
  def correct_user
    @artbook = current_user.artbooks.find_by(id: params[:id])
    unless @artbook
      redirect_to root_url
    end
  end
end
