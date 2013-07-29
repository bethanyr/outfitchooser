class ShirtsController < ApplicationController
  before_filter :find_shirt, :only => [:show, :edit, :update, :destroy]

  def index
    @shirts = Shirt.all
  end

  def new
    @shirt = Shirt.new
  end

  def create
    @shirt = Shirt.new(params[:shirt])
    if @shirt.save
      flash[ :notice] = "Shirt has been added."
      redirect_to @shirt
    else
      flash[ :alert] = "Shirt has not been added."
      render :action => "new"
    end
  end

  def show

  end

  def destroy
    @shirt.destroy
    flash[:notice] = "Shirt has been removed from your warddrobe."
    redirect_to shirts_path
  end

  def edit

  end

  def update
    @shirt.update_attributes(params[:shirt])
    flash[:notice] = "Shirt has been updated."
    redirect_to [@shirt]
  end

  private
    def find_shirt
      @shirt = Shirt.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The shirt you were looking" +
            " for could not be found."
      redirect_to shirts_path
    end
end
