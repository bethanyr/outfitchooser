class OutfitsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :find_outfit, :only => [:show, :edit, :update, :destroy]
  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(params[:outfit])
    if @outfit.save
      flash[ :notice] = "Outfit has been added."
      redirect_to @outfit
    else
      flash[ :alert] = "Outfit has not been added."
      render :action => "new"
    end
  end

  def show

  end

  def destroy
    @outfit.destroy
    flash[:notice] = "Outfit has been removed."
    redirect_to root_path
  end

  def edit

  end

  def update
    @outfit.update_attributes(params[:outfit])
    flash[:notice] = "Outfit has been updated."
    redirect_to [@outfit]
  end

  private
    def find_outfit
      @outfit = Outfit.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The outfit you were looking" +
            " for could not be found."
      redirect_to root_path
    end
end
